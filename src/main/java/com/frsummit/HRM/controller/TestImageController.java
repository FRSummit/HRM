package com.frsummit.HRM.controller;

import com.frsummit.HRM.crud_repository.TestImageRepository;
import com.frsummit.HRM.model.TestImage;
import com.frsummit.HRM.service.TestImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class TestImageController {

    @Autowired
    private TestImageRepository testImageRepository;

    @Autowired
    private TestImgService testImgService;

    private final Path rootLocation = Paths.get("upload-dir");

    @RequestMapping(value = "/test-image", method = RequestMethod.GET)
    public String testImageForm(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//    public ModelAndView testImageForm() throws IOException{

        // get the thumb from the user entity
        List<TestImage> list = testImgService.findImg();
        TestImage ti = list.get(0);
        byte[] thumb = ti.getData();
        model.addAttribute("image_id", response);

        String name = "userAvatar";
        response.setContentType("image/jpeg");
        response.setContentLength(thumb.length);

//        response.setHeader("Content-Disposition", "inline; filename=\"" + name + "\"");

        BufferedInputStream input = null;
        BufferedOutputStream output = null;
        File file = null;

        try {
            input = new BufferedInputStream(new ByteArrayInputStream(thumb));
            output = new BufferedOutputStream(response.getOutputStream());
            byte[] buffer = new byte[8192];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
                output.flush();
            }
        } catch (IOException e) {
            System.out.println("There are errors in reading/writing image stream "
                    + e.getMessage());
        }/* finally {
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

        /*InputStream inputStream = new ByteArrayInputStream(thumb);
        BufferedImage bufferedImage = ImageIO.read(inputStream);

        System.out.println(bufferedImage);
        model.addAttribute("img", bufferedImage);*/

        /*ByteArrayInputStream in = new ByteArrayInputStream(thumb);
        BufferedImage bufferedImage = ImageIO.read(in);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try{
            ImageIO.write(bufferedImage, "jpeg", out);
        } catch (IOException e){
            System.out.println("There are errors in reading/writing image stream " + e.getMessage());
        }
        System.out.println(ImageIO.write(bufferedImage, "jpeg", out));
        model.addAttribute("img", ImageIO.write(bufferedImage, "jpeg", out));*/

        //System.out.println(getMyFile());
        //model.addAttribute("img", getMyFile());

//        ModelAndView modelAndView = new ModelAndView("zz_test_image");
//        System.out.println("1");
//        modelAndView.addObject("image_id", getMyFile2());
//        System.out.println("2");
//        return modelAndView;

//        model.addAttribute("myimage", ti.getData());
        model.addAttribute("myimage", output);
        return "zz_test_image";
    }

    @RequestMapping(value = "/upload-image", method = RequestMethod.POST)
    public ModelAndView uploadImage(
            //@RequestParam(value = "fileUpload") CommonsMultipartFile[] myFile){
            @RequestParam(value = "fileUpload") MultipartFile[] myFile) throws IOException {

        ModelAndView modelAndView = new ModelAndView();
        System.out.println(myFile);

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


//    Return Image
    public BufferedImage getMyFile(){

        List<TestImage> list = testImgService.findImg();
        TestImage ti = list.get(0);
        byte[] thumb = ti.getData();

        String fileName = "file.test";

        BufferedOutputStream bs = null;
        BufferedImage img = null;
        try{
            img = ImageIO.read(new ByteArrayInputStream(thumb));
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {

            FileOutputStream fs = new FileOutputStream(new File(fileName));
            bs = new BufferedOutputStream(fs);
            bs.write(thumb);
            bs.close();
            bs = null;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return img;
    }

    public void store(MultipartFile file){
        try {
            //copy the selected file and paste it to rootLocation folder (just instruction, after a call add method then it works)
            Files.copy(file.getInputStream(), this.rootLocation.resolve(file.getOriginalFilename()));
        } catch (Exception e) {
            throw new RuntimeException("FAIL!");
        }
    }

    @RequestMapping(value = "/image/{image_id}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity<byte[]> getImage(@PathVariable("image_id") Long imageId) throws IOException {

        System.out.println("2.5");
        List<TestImage> list = testImgService.findImg();
        System.out.println("3");
        TestImage ti = list.get(0);
        System.out.println("4");
        byte[] imageContent = ti.getData();//get image from DAO based on id



        System.out.println("5");
        final HttpHeaders headers = new HttpHeaders();
        System.out.println("6");
        headers.setContentType(MediaType.IMAGE_PNG);
        System.out.println("7");
        return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
    }

    public byte[] getMyFile2() throws IOException {

        List<TestImage> list = testImgService.findImg();
        TestImage ti = list.get(0);
        byte[] imageContent = ti.getData();

        InputStream in = new ByteArrayInputStream(ti.getData());
        BufferedImage img = ImageIO.read(in);
        ByteArrayOutputStream bao = new ByteArrayOutputStream();
        ImageIO.write(img, "jpg", bao);
        return bao.toByteArray();
    }
}
