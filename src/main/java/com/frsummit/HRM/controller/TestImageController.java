package com.frsummit.HRM.controller;

import com.frsummit.HRM.crud_repository.TestImageRepository;
import com.frsummit.HRM.model.TestImage;
import com.frsummit.HRM.service.TestImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class TestImageController {

    @Autowired
    private TestImageRepository testImageRepository;

    @Autowired
    private TestImgService testImgService;

    @RequestMapping(value = "/test-image", method = RequestMethod.GET)
    public String testImageForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        // get the thumb from the user entity
/*        List<TestImage> list = testImgService.findImg();
        TestImage ti = list.get(0);
        byte[] thumb = ti.getData();

        String name = "userAvatar";
        response.setContentType("image/jpeg");
        response.setContentLength(thumb.length);

        response.setHeader("Content-Disposition", "inline; filename=\"" + name + "\"");

        BufferedInputStream input = null;
        BufferedOutputStream output = null;

        try {
            input = new BufferedInputStream(new ByteArrayInputStream(thumb));
            output = new BufferedOutputStream(response.getOutputStream());
            byte[] buffer = new byte[8192];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        } catch (IOException e) {
            System.out.println("There are errors in reading/writing image stream "
                    + e.getMessage());
        } finally {
            if (output != null)
                try {
                    output.close();
                } catch (IOException ignore) {
                }
            if (input != null)
                try {
                    input.close();
                } catch (IOException ignore) {
                }
        }
*/
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
