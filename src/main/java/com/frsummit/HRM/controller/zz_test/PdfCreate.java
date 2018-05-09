package com.frsummit.HRM.controller.zz_test;

import com.frsummit.HRM.model.User;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.FileOutputStream;

@Controller
public class PdfCreate {

    private static String FILE = "C:/Users/F R Summit/Desktop/doc.pdf";

    @RequestMapping(value = "/pdf")
    public String MyFun(){
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            document.open();
            Paragraph paragraph = new Paragraph("This is My World");
            document.add(paragraph);

            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100.0f);
            table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 1.0f});
            table.setSpacingBefore(10);

            // define font for table header row
            Font font = FontFactory.getFont(FontFactory.HELVETICA);
            font.setColor(BaseColor.WHITE);

            // define table header cell
            PdfPCell cell = new PdfPCell();
            cell.setBackgroundColor(BaseColor.BLUE);
            cell.setPadding(5);

            // write table header
            cell.setPhrase(new Phrase("Book Title", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Author", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("ISBN", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Published Date", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Price", font));
            table.addCell(cell);


            cell.setPhrase(new Phrase("Book Title", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Author", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("ISBN", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Published Date", font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Price", font));
            table.addCell(cell);

            // write table row data
//            for (User aBook : users) {
//                table.addCell(aBook.getMyRole());
//                table.addCell(aBook.getId());
//                table.addCell(aBook.getDepartment());
//                table.addCell(aBook.getDesignation());
//                table.addCell(String.valueOf(aBook.getFirstName()));
//            }

            document.add(table);

            document.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return "home";
    }
}

/*
*
* // get data model which is passed by the Spring container
        List<Book> listBooks = (List<Book>) model.get("listBooks");

        doc.add(new Paragraph("Recommended books for Spring framework"));

        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 1.0f});
        table.setSpacingBefore(10);

        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.WHITE);

        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(5);

        // write table header
        cell.setPhrase(new Phrase("Book Title", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Author", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("ISBN", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Published Date", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Price", font));
        table.addCell(cell);

        // write table row data
        for (Book aBook : listBooks) {
            table.addCell(aBook.getTitle());
            table.addCell(aBook.getAuthor());
            table.addCell(aBook.getIsbn());
            table.addCell(aBook.getPublishedDate());
            table.addCell(String.valueOf(aBook.getPrice()));
        }

        doc.add(table);
* */









/*

List<Course> courses = (List<Course>) model.get("courses");

        PdfPTable table = new PdfPTable(3);

        table.addCell("ID");
        table.addCell("Name");
        table.addCell("Date");

        for (Course course : courses){
            table.addCell(String.valueOf(course.getId()));
            table.addCell(course.getName());
            table.addCell(DATE_FORMAT.format(course.getDate()));
        }

        document.add(table);


 */


/*
*
* List<Course> courses = (List<Course>) model.get("courses");

        PdfPTable table = new PdfPTable(3);
        table.setWidths(new int[]{10, 60, 30});

        table.addCell("ID");
        table.addCell("Name");
        table.addCell("Date");

        for (Course course : courses){
            table.addCell(String.valueOf(course.getId()));
            table.addCell(course.getName());
            table.addCell(DATE_FORMAT.format(course.getDate()));
        }
* */