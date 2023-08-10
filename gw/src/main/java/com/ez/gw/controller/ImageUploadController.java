package com.ez.gw.controller;

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class ImageUploadController {

    @PostMapping("/pds_upload")
    public ResponseEntity<String> uploadImage(@RequestPart("upload") MultipartFile file) {
        try {
            String uploadDir = "D:\\lecture\\workspace_list\\sp_final_ws\\final\\gw\\src\\main\\webapp\\pds_upload\\";
            String fileName = file.getOriginalFilename();
            File uploadPath = new File(uploadDir + fileName);
            
            file.transferTo(uploadPath);
            String imageUrl = "/pds_upload/" + fileName;
            JSONObject response = new JSONObject().put("url", imageUrl);
            return ResponseEntity.ok(response.toString());
        } catch (IOException e) {
            JSONObject errorResponse = new JSONObject().put("error", new JSONObject().put("message", "업로드 실패."));
            return ResponseEntity.badRequest().body(errorResponse.toString());
        }
    }
}