package com.sist.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.GalleryBoardDAO;
import com.sist.dao.memberDAO;
import com.sist.vo.GalleryBoardVO;

@Controller
@RequestMapping("/puzzle/{cl}/gallery/")
public class GalleryBoardController {
   @Autowired
   private GalleryBoardDAO dao;
   @Autowired
   private memberDAO member;

   @GetMapping("list.do")
   public String gallery_list(String page, Model model, @PathVariable int cl, HttpSession session) {

      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);
      
      if (page == null)
         page = "1";
      int curpage = Integer.parseInt(page);
      int rowSize = 15;
      int start = (rowSize * curpage) - (rowSize - 1);
      int end = rowSize * curpage;

      Map map = new HashMap();
      map.put("start", start);
      map.put("end", end);
      map.put("cl_no", cl);

      List<GalleryBoardVO> list = dao.galleryBoardListData(map);
      int count = dao.galleryBoardRowCount();
      int totalpage = dao.galleryBoardTotalPage();
      count = count - ((curpage * rowSize) - rowSize);
      String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

      final int BLOCK = 3;
      int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
      int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

      if (endPage > totalpage)
         endPage = totalpage;

      model.addAttribute("curpage", curpage);
      model.addAttribute("list", list);
      model.addAttribute("count", count);
      model.addAttribute("totalpage", totalpage);
      model.addAttribute("startPage", startPage);
      model.addAttribute("endPage", endPage);
      model.addAttribute("today", today);

      return "gallery/list";
   }

   @GetMapping("insert.do")
   public String gallery_insert(Model model, @PathVariable int cl, HttpSession session) {
      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);

      return "gallery/insert";
   }

   @PostMapping("insert_ok.do")
   public String gallery_insert_ok(Model model, @PathVariable int cl, HttpSession session, GalleryBoardVO vo) {

      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);

      String id = (String) session.getAttribute("id");

      vo.setCl_no(cl);
      vo.setId(id);

      List<MultipartFile> list = vo.getFiles();
      if (list == null) // 업로드가 안된 상태
      {
         vo.setB_filename("");
         vo.setB_filesize("");
         vo.setB_filecount(0);
      } else // 업로드가 된 상태
      {
         String tempName = "";
         String tempSize = "";

         for (MultipartFile mf : list) {
             String path = "C:\\springDev\\project2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team2_SpringProject2aa\\resources\\uploadFileImages\\";

            String fn = mf.getOriginalFilename(); // 사용자 보낸 파일명 읽기

            File file = new File(path + fn);

            try {
               mf.transferTo(file);// 리얼패스 업로드
            } catch (Exception ex) {
            }
            tempName += fn + ",";
            tempSize += file.length() + ",";
         }
         tempName = tempName.substring(0, tempName.lastIndexOf(","));
         tempSize = tempSize.substring(0, tempSize.lastIndexOf(","));
         vo.setB_filename(tempName);
         vo.setB_filesize(tempSize);
         vo.setB_filecount(list.size());// 다운로드 여부
      }
      dao.galleryBoardInsert(vo);

      return "redirect:list.do";
   }

   @GetMapping("detail.do")
   public String gallery_detail(@PathVariable int cl, HttpSession session, int b_no, Model model,
         HttpServletRequest request) {

      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);
      GalleryBoardVO vo = dao.galleryBoardDetailData(b_no);

      if (vo.getB_filecount() != 0) {
         // 파일이 업로드가 되었다면
         List<String> fList = new ArrayList<String>(); // 파일명
         List<String> sList = new ArrayList<String>(); // 파일크기
         List<String> iList = new ArrayList<String>(); // 리얼패스에 저장된 이미지 출력
         String path = "C:\\springDev\\project2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team2_SpringProject2aa\\resources\\uploadFileImages\\";

         StringTokenizer st = new StringTokenizer(vo.getB_filename(), ",");
         while (st.hasMoreTokens()) {
            String fn = st.nextToken();
            fList.add(fn);
            iList.add("/resources/uploadFileImages/" + fn);
         }
         st = new StringTokenizer(vo.getB_filesize(), ",");
         while (st.hasMoreTokens()) {
            sList.add(st.nextToken());
         }

         model.addAttribute("fList", fList);
         model.addAttribute("sList", sList);
         model.addAttribute("iList", iList);
      }

      model.addAttribute("vo", vo);

      return "gallery/detail";
   }

   @GetMapping("download.do")
   public void databoard_download(Model model, @PathVariable int cl, HttpSession session, String fn,
         HttpServletResponse response) throws IOException {

      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);
      // Cookie 값을 전송해줘야해서 response를 사용
      // 1. header 전송 => 다운로드창 열어준다
      response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fn, "UTF-8"));

      String path = "C:\\springDev\\project2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team2_SpringProject2aa\\resources\\uploadFileImages\\";

      File file = new File(path + fn);
      response.setContentLength((int) file.length());
      BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
      BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

      int i = 0;
      byte[] buffer = new byte[1024];
      while ((i = bis.read(buffer, 0, 1024)) != -1) { // -1 : EOF
         bos.write(buffer, 0, i);
      }
      bis.close();
      bos.close();
   }

   @GetMapping("update.do")
   public String gallery_update(@PathVariable int cl, HttpSession session, int no, Model model) {
      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);

      GalleryBoardVO vo = dao.galleryBoardDetailData(no);

      if (vo.getB_filecount() != 0) {
         // 파일이 업로드가 되었다면
         List<String> fList = new ArrayList<String>(); // 파일명
         List<String> sList = new ArrayList<String>(); // 파일크기

         StringTokenizer st = new StringTokenizer(vo.getB_filename(), ",");
         while (st.hasMoreTokens()) {
            fList.add(st.nextToken());
         }
         st = new StringTokenizer(vo.getB_filesize(), ",");
         while (st.hasMoreTokens()) {
            sList.add(st.nextToken());
         }

         model.addAttribute("fList", fList);
         model.addAttribute("sList", sList);
      }

      model.addAttribute("vo", vo);

      return "gallery/update";
   }

   @PostMapping("update_ok.do")
   public String gallery_update_ok(Model model, @PathVariable int cl, HttpSession session, GalleryBoardVO vo) {
      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);
      List<MultipartFile> list = vo.getFiles();
      GalleryBoardVO gvo = dao.galleryBoardDetailData(vo.getB_no());

      if (list == null) // 업로드가 안된 상태
      {
         dao.galleryBoardUpdate2(vo);
      } else // 업로드가 된 상태
      {
         String tempName = gvo.getB_filename();
         System.out.println(tempName);
         String tempSize = gvo.getB_filesize();
         System.out.println(tempSize);

         for (MultipartFile mf : list) {
            String fn = mf.getOriginalFilename(); // 사용자 보낸 파일명 읽기
            String path = "C:\\springDev\\project2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team2_SpringProject2aa\\resources\\uploadFileImages\\";
            File file = new File(path + fn);
            try {
               mf.transferTo(file);// 실제 업로드
            } catch (Exception ex) {
            }
            tempName += "," + fn;
            tempSize += "," + file.length();
         }
         vo.setB_filename(tempName);
         vo.setB_filesize(tempSize);
         vo.setB_filecount(list.size());// 다운로드 여부

         dao.galleryBoardUpdate1(vo);
      }

      return "redirect:detail.do?b_no=" + vo.getB_no();
   }

   @PostMapping("file_delete.do")
   @ResponseBody
   public String gallery_file_del(Model model, @PathVariable int cl, HttpSession session, String fn, String fs,
         int b_no) {

      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);

      String result = "";

      // db에서 update해주면 될듯
      GalleryBoardVO vo = dao.galleryBoardDetailData2(b_no);
      String ss = "";
      String dd = "";

      if (vo.getB_filecount() != 0) {
         // 파일이 업로드가 되었다면
         String s1 = "";
         String s2 = "";

         StringTokenizer st = new StringTokenizer(vo.getB_filename(), ",");
         while (st.hasMoreTokens()) {
            s1 = st.nextToken(); // st = wada.확장자
            System.out.println("fn1:" + fn);
            System.out.println("fs1:" + s1);
            if (!(s1.equals(fn))) { // 삭제하고자 하는 fn값과 같지않으면 sl에 저장
               ss += s1 + ",";
               System.out.println("fn2:" + fn);
               System.out.println("fs2:" + s1);
            }
         }
         ss = ss.substring(0, ss.lastIndexOf(","));
         Map map = new HashMap();
         map.put("b_no", b_no);
         map.put("b_filename", ss);
         dao.galleryFilenameDelete(map);

         st = new StringTokenizer(vo.getB_filesize(), ",");
         while (st.hasMoreTokens()) {
            s2 = st.nextToken();
            if (s2 != fs) {
               dd += s2 + ",";
            }
         }
         dd = dd.substring(0, dd.lastIndexOf(","));
         Map map2 = new HashMap();
         map2.put("b_no", b_no);
         map2.put("b_filesize", dd);

         dao.galleryFilesizeDelete(map2);

         result = "GOOD";
      }

      return result;
   }

   @RequestMapping("delete_ok.do")
   public String gallery_delete_ok(Model model, @PathVariable int cl, HttpSession session, int no) {
      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);
      dao.galleryBoardDelete(no);

      return "redirect:list.do";
   }

   @PostMapping("find.do")
   public String gallery_find(@PathVariable int cl, HttpSession session, String[] fs, String ss, Model model) {

      int grade = member.ismember(session, cl);
      model.addAttribute("grade", grade);
      model.addAttribute("cl", cl);
      if (fs != null) {
         Map map = new HashMap();
         map.put("fsArr", fs);
         map.put("ss", ss);
         List<GalleryBoardVO> list = dao.gallerySearchData(map);
         int count = dao.galleryBoardRowCount();
         String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

         model.addAttribute("list", list);
         model.addAttribute("count", count);
         model.addAttribute("today", today);
      }
      return "gallery/find";
   }
}