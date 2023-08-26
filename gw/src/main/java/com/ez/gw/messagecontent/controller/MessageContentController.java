package com.ez.gw.messagecontent.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.gw.dept.model.DeptService;
import com.ez.gw.dept.model.DeptVO;
import com.ez.gw.employee.model.EmployeeService;
import com.ez.gw.message.model.MessageService;
import com.ez.gw.message.model.MessageVO;
import com.ez.gw.messagecontent.model.MessageContentService;
import com.ez.gw.messagecontent.model.MessageContentVO;
import com.ez.gw.messagecontent.model.MessageViewVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/message")
public class MessageContentController {
	private static final Logger logger=LoggerFactory.getLogger(MessageContentController.class);
	private final MessageContentService messageContentService;
	private final MessageService messageService;
	private final EmployeeService employeeService;
	private final DeptService deptService;
	
	@GetMapping("/messageWrite")
	public String messageWrite(Model model){
		logger.info("쪽지 보내기 페이지");
		
		List<Map<String, Object>> empList = employeeService.selectAllEmp();
		List<DeptVO> deptList = deptService.selectAllDept();
		
		model.addAttribute("empList",empList);
		model.addAttribute("deptList",deptList);
		
		return "message/messageWrite";
	}
	
	@PostMapping("/messageWrite")
	public String messageWrite_Post(@ModelAttribute MessageContentVO mcVo,
			@RequestParam(required = true) int[] reader, Model model, HttpSession session){
		int empNo=(int)session.getAttribute("empNo");
		logger.info("쪽지 처리 페이지 보내는 사람	empNo={}, mcVo={}",empNo,mcVo);
		logger.info("쪽지 처리 페이지 받는 사람 reader={}",reader);
		
		mcVo.setEmpNo(empNo);
		int cnt=messageContentService.insertMessage(mcVo);
		logger.info("보낸사람 쪽지처리 결과 cnt={}",cnt);
		
		if(cnt>0) {
			MessageVO vo=new MessageVO();
			vo.setMessageNo(mcVo.getMessageNo());
			for(int i=0; i<reader.length;i++) {
				vo.setReader(reader[i]);
				cnt=messageService.insertMessage(vo);
			}
		}
		
		String msg="쪽지 처리 중 에러가 발생했습니다.", url="/message/messageWrite";
		if(cnt>0) {
			msg="쪽지가 발송되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/messageList")
	public String messageList(HttpSession session,Model model){
		int empNo=(int)session.getAttribute("empNo");
		logger.info("쪽지함 페이지 empNo={}",empNo);
		
		List<Integer> readerList = messageContentService.selectAllReader(empNo);
		logger.info("내가 보낸 쪽지 받은사람 조회 readList={}",readerList.size());
		
		
		List<MessageViewVO> mViewList = new ArrayList<>();
		if(readerList.size()>0) {
			for(int i=0; i<readerList.size(); i++) {
				MessageViewVO mViewVo = new MessageViewVO();
				mViewVo.setEmpNo(empNo);
				mViewVo.setReader(readerList.get(i));
				mViewVo=messageContentService.selectLastMessageByReader(mViewVo);
				logger.info("마지막 메시지 조회 받은사람={},mViewVo={}",readerList.get(i),mViewVo);
				mViewList.add(mViewVo);
			}
		}
		
		model.addAttribute("mViewList",mViewList);
		
		return "message/messageList";
	}
}
