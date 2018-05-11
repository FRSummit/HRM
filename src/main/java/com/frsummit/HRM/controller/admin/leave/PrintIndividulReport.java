package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.LeaveService;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.FileOutputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.List;

@Controller
public class PrintIndividulReport {

    private static String FILE = "C:/Users/F R Summit/Desktop/individual-leave.pdf";

    @Autowired
    private MyAuthorization myAuthorization;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private HRRecordService hrRecordService;

    @RequestMapping(value = "/admin/print-individual-leave-report", method = RequestMethod.GET)
    public String individualReportPrint(@RequestParam(value = "userId") String userId){try {
        String[] months =  {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
        String[] days = {"one", "two", "three", "four", "five",
                "six", "seven", "eight", "nine", "ten",
                "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                "sixteen", "seventeen", "eighteen", "nineteen", "twenty",
                "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive",
                "twentysix", "twentyseven", "twentyeight", "twentynine", "thirty", "thirtyone"};

        List<Leaves> leavesList = leaveService.findLeavesByUserId(userId);


        Document document = new Document(PageSize.A4.rotate(),0,0,0,0);
        PdfWriter.getInstance(document, new FileOutputStream(FILE));
//        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("HelloWorld.pdf"));
//        document.open();
//        document.add(new Paragraph("A Hello World PDF document."));
//        document.close();
//        writer.close();
        document.open();

        Font headerFont=new Font(Font.FontFamily.TIMES_ROMAN,20.0f,Font.BOLD, BaseColor.BLACK);
        Paragraph header = new Paragraph("Leave Record Card", headerFont);
        header.setAlignment(Element.ALIGN_CENTER);
        document.add(header);

        Font headerUserFont=new Font(Font.FontFamily.TIMES_ROMAN,15.0f, Font.NORMAL,BaseColor.BLACK);
        Paragraph headerUser = new Paragraph("Year " + String.valueOf(LocalDateTime.now().getYear()), headerUserFont);
        headerUser.setAlignment(Element.ALIGN_CENTER);
        document.add(headerUser);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            Employee Details
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

        Font generalHeaderFont=new Font(Font.FontFamily.TIMES_ROMAN,20.0f, Font.BOLD,BaseColor.BLACK);
        Paragraph empDetailsHeader = new Paragraph("Employer Details", generalHeaderFont);
        document.add(empDetailsHeader);

        Font generalFont=new Font(Font.FontFamily.TIMES_ROMAN,14.0f, Font.NORMAL,BaseColor.BLACK);

        Paragraph empId = new Paragraph("Employer ID               : " + myAuthorization.userFromEmailOrId().getId(), generalFont);
        document.add(empId);

        Paragraph empName = new Paragraph("Employer Name          : " + myAuthorization.userFullName(), generalFont);
        document.add(empName);

        Paragraph empDept = new Paragraph("Employer Department : " + myAuthorization.userFromEmailOrId().getDepartment(), generalFont);
        document.add(empDept);

        Paragraph empDesg = new Paragraph("Employer Designation : " + myAuthorization.userFromEmailOrId().getDesignation(), generalFont);
        document.add(empDesg);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//        Chart
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        Paragraph leaveCard = new Paragraph("\nLeave Card", generalFont);
        leaveCard.setAlignment(Element.ALIGN_CENTER);
        document.add(leaveCard);

        PdfPTable table = new PdfPTable(32);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[] {0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f,
                0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f,
                0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f , 0.3f, 0.3f});
        table.setSpacingBefore(10);

        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.BLACK);

        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.WHITE);
        cell.setPadding(1);

//        Create The date number
        for(int i=0; i<=31; i++){
            if(i==0){
                cell.setPhrase(new Phrase(" ", font));
                table.addCell(cell);
            }else{
                cell.setPhrase(new Phrase(String.valueOf(i), font));
                table.addCell(cell);
            }
        }

        List<String> applyFromList = new ArrayList<>();
        List<String> applyToList = new ArrayList<>();
        if(leavesList.size() != 0){
            for(int i=0; i<leavesList.size(); i++){
                Leaves leaves = leavesList.get(i);
                String applyFrom = leaves.getLeaveApplyFrom().toString();
                String applyTo = leaves.getLeaveApplyTo().toString();

                String[] partsApplyFrom = applyFrom.split(" ");
                String[] partsApplyTo = applyTo.split(" ");

                applyFromList.add(partsApplyFrom[0]);
                applyToList.add(partsApplyTo[0]);
            }
        }

        System.out.println("////////////" + applyFromList.get(0) + " " + applyToList.get(0));
        System.out.println("////////////" + applyFromList.get(1) + " " + applyToList.get(1));

//        Set the month name
        for(int i=0; i<12; i++){
            for(int j=0; j<=31;j++){
                if(j==0){
                    cell.setPhrase(new Phrase(months[i], font));
                    table.addCell(cell);
                }else{

                    for(int k=0; k<applyFromList.size(); k++){
                        String[] applyFromParts = applyFromList.get(k).split("-");
                        String[] applyToParts = applyToList.get(k).split("-");

                        String applyFromYear = applyFromParts[0];
                        String applyFromMonth = applyFromParts[1];
                        String applyFromDay = applyFromParts[2];

                        String applyToYear = applyToParts[0];
                        String applyToMonth = applyToParts[1];
                        String applyToDay = applyToParts[2];

//                        if(applyFromYear.equalsIgnoreCase(String.valueOf(LocalDateTime.now().getYear()))
//                                && applyToYear.equalsIgnoreCase(String.valueOf(LocalDateTime.now().getYear()))){
//                            if(applyFromMonth <= String.valueOf(j))
//                        }
                    }

                    cell.setPhrase(new Phrase("Y", font));
                    table.addCell(cell);
                }
            }
        }

        document.add(table);

        Paragraph newLine = new Paragraph("\n\n\n", generalFont);
        document.add(newLine);

        Chunk glue = new Chunk(new VerticalPositionMark());
        Paragraph p = new Paragraph(".........................");
        p.add(new Chunk(glue));
        p.add(".........................");
        p.add(new Chunk(glue));
        p.add(".........................");
        document.add(p);


//            Chunk glue2 = new Chunk(new VerticalPositionMark());
//            Paragraph p2 = new Paragraph(myAuthorization.userFullName());
//            p2.add(new Chunk(glue2));
//            p2.add("Supervisor");
//            p2.add(new Chunk(glue2));
//            p2.add("Chairman");
//            document.add(p2);

        document.close();
    }catch (Exception e){
        e.printStackTrace();
    }
        return "leaves-report-individual";
    }

    public void leaveCard() throws DocumentException {
    }
}























//Faltu jinish


// write table header
       /* cell.setPhrase(new Phrase("  ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);*/

/*
        cell.setPhrase(new Phrase("Jan", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        // write table header
        cell.setPhrase(new Phrase("Feb", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Mar", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        // write table header
        cell.setPhrase(new Phrase("Apr", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("May", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        // write table header
        cell.setPhrase(new Phrase("Jun", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Jul", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        // write table header
        cell.setPhrase(new Phrase("Aug", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Sep", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        // write table header
        cell.setPhrase(new Phrase("Oct", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Nov", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);

        // write table header
        cell.setPhrase(new Phrase("Dec", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("1", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("2", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("3", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("4", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("5", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("6", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("7", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("8", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("9", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("10", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("11", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("12", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("13", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("14 ", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("15", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("16", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("17", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("18", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("19", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("20", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("21", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("22", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("23", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("24", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("25", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("26", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("27", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("28", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("29", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("30", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("31", font));
        table.addCell(cell);
*/
