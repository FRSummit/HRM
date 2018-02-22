package com.frsummit.HRM.controller;

import com.frsummit.HRM.crud_repository.TestImageRepository;
import com.frsummit.HRM.model.TestImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class TestImageController {

    @Autowired
    private TestImageRepository testImageRepository;

    @RequestMapping(value = "/test-image", method = RequestMethod.GET)
    public String testImageForm(){
        return "zz_test_image";
    }

    @RequestMapping(value = "/upload-image", method = RequestMethod.POST)
    public ModelAndView uploadImage(
            //@RequestParam(value = "fileUpload") CommonsMultipartFile[] myFile){
            @RequestParam(value = "fileUpload") MultipartFile[] myFile) throws IOException {

        ModelAndView modelAndView = new ModelAndView();

        if(myFile != null && myFile.length > 0){
            //for(CommonsMultipartFile file : myFile){
            for(MultipartFile file : myFile){
                System.out.println("Saving File : " + file.getOriginalFilename());

                TestImage testImage = new TestImage();
                testImage.setFileName(file.getOriginalFilename());
                testImage.setData(file.getBytes());
                System.out.println(file.getBytes());
                testImageRepository.save(testImage);
                System.out.println("Success");
            }
        }

        modelAndView.setViewName("zz_test_image");
        return modelAndView;
    }
}
