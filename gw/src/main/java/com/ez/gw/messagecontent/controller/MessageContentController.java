package com.ez.gw.messagecontent.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String messageWrite(@RequestParam(defaultValue = "0") int empNo, Model model){
		logger.info("쪽지 보내기 페이지 파라미터 empNo={}",empNo);
		
		List<Map<String, Object>> empList = employeeService.selectAllEmp();
		List<DeptVO> deptList = deptService.selectAllDept();
		Map<String, Object> empSet = new HashMap<>(); 
		if(empNo!=0) {
			empSet =employeeService.selectEmpByEmpNo(empNo);
		}
		
		model.addAttribute("empSet",empSet);
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
			url="/message/messageList";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/messageDelete")
	public String messageDelete(@ModelAttribute MessageViewVO vo,
			Model model, HttpSession session){
		int empNo=(int)session.getAttribute("empNo");
		int cnt=0;
		vo.setEmpNo(empNo);
		
		if(vo.getReader()!=empNo) {
			logger.info("보낸쪽지 삭제 처리 empNo={}, mcvo={}",empNo,vo);
			cnt=messageContentService.updateDelFlagOrDelete(vo);
		}else {
			logger.info("받은쪽지 삭제 처리 empNo={}, mcvo={}",empNo,vo);
			cnt=messageService.updateDelFlagOrDelete(vo);
		}
		logger.info("삭제 처리 결과 cnt={}",cnt);
		
		
		
		
		String msg="쪽지 삭제처리 중 에러가 발생했습니다.", url="/message/messageList";
		if(cnt>0) {
			msg="쪽지가 삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/messageList")
	public String messageList(HttpSession session,Model model){
		int empNo=(int)session.getAttribute("empNo");
		logger.info("쪽지함 페이지 empNo={}",empNo);
		
		
		List<MessageViewVO> mViewList = messageContentService.selectLastMessage(empNo);
		logger.info("마지막 메시지 조회 mViewList={}",mViewList.size());
		
		model.addAttribute("mViewList",mViewList);
		
		return "message/messageList";
	}
	
	@RequestMapping("/messageList5")
	public String messageList5(HttpSession session,Model model){
		int empNo=(int)session.getAttribute("empNo");
		logger.info("마지막 받은 메시지 empNo={}",empNo);
		
		
		List<MessageViewVO> list = messageContentService.selectLastMessage5(empNo);
		logger.info("마지막 받은 메시지 5개 조회 list={}",list.size());
		
		model.addAttribute("list",list);
		
		return "message/messageList5";
	}
	
	@ResponseBody
	@RequestMapping("/messageListClickAjax")
	public Map<String, Object> messageListClickAjax(@RequestParam(defaultValue = "0") int reader,
			@RequestParam(required = false) String messageContent, HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		int empNo=(int)session.getAttribute("empNo");
		
		MessageViewVO mViewVo = new MessageViewVO();
		mViewVo.setEmpNo(empNo);
		mViewVo.setReader(reader);
		
		if(messageContent==null || messageContent.isEmpty()) {
			logger.info("쪽지함 클릭 Ajax reader={},empNo={}",reader,empNo);
			
			Map<String, Object> empMap = employeeService.selectEmpByEmpNo(reader);
			logger.info("상대방 정보 조회 empMap={}",empMap);
			
			int cnt=messageContentService.updateReadDate(mViewVo);
			logger.info("받은 메시지에 대한 readDate 처리 cnt={}",cnt);
			
			resultMap.put("empMap", empMap);
		}else {
			logger.info("쪽지보내기 Ajax reader={},empNo={},messageContent={}",reader,empNo,messageContent);
			
			MessageContentVO mcVo=new MessageContentVO();
			mcVo.setEmpNo(empNo);
			mcVo.setMessageContent(messageContent);
			
			int cnt=messageContentService.insertMessage(mcVo);
			logger.info("보낸사람 쪽지처리 결과 cnt={}",cnt);
			
			if(cnt>0) {
				MessageVO vo=new MessageVO();
				vo.setMessageNo(mcVo.getMessageNo());
				vo.setReader(reader);
				
				cnt=messageService.insertMessage(vo);
				logger.info("받는사람 쪽지처리 결과 cnt={}",cnt);
			}
		}
		
		List<MessageViewVO> messageList=messageContentService.selectAllMyMessage(mViewVo);
		logger.info("메시지 전체 조회 messageList={}",messageList.size());
		
		resultMap.put("messageList", messageList);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping("/newMessageAjax")
	public int messageListClickAjax(HttpSession session){
		int empNo=(int)session.getAttribute("empNo");
		logger.info("새로운 메시지 조회 empNo={}",empNo);
			
		int cnt=messageService.newMessage(empNo);
		logger.info("새로운 메시지 조회 결과 cnt={}",cnt);
		
		return cnt;
	}
	
	@RequestMapping("/allDelete")
	public String messageAllDelete(@RequestParam(defaultValue = "0") int reader,
			Model model,HttpSession session){
		int empNo=(int)session.getAttribute("empNo");
		logger.info("메시지 전체삭제  reader={},empNo={}",reader,empNo);
		
		MessageViewVO vo = new MessageViewVO();
		vo.setEmpNo(empNo);
		vo.setReader(reader);
		
		List<Integer> sendNoList = messageContentService.searchSendMessageNo(vo);
		List<Integer> readNoList = messageContentService.searchReadMessageNo(vo);
		
		int cnt=0;
		String msg="쪽지 삭제 처리 중 에러가 발생했습니다.",url="/message/messageList";
		
		if(sendNoList.size()!=0) {
			for(int i=0;i<sendNoList.size();i++) {
				vo.setMessageNo(sendNoList.get(i));
				logger.info("보낸쪽지 삭제 처리 vo={}",vo);
				
				cnt=messageContentService.updateDelFlagOrDelete(vo);
				logger.info("삭제 처리 결과 cnt={}",cnt);	
				if(cnt>0) {
					msg="쪽지가 삭제되었습니다.";
				}else {
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "common/message";
				}
			}
		}
		
		if(readNoList.size()!=0) {
			for(int i=0;i<readNoList.size();i++) {
				vo.setMessageNo(readNoList.get(i));
				logger.info("받은쪽지 삭제 처리 vo={}",vo);
				
				cnt=messageService.updateDelFlagOrDelete(vo);
				logger.info("삭제 처리 결과 cnt={}",cnt);	
				if(cnt>0) {
					msg="쪽지가 삭제되었습니다.";
				}else {
					model.addAttribute("msg",msg);
					model.addAttribute("url",url);
					return "common/message";
				}
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
}
