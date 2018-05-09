package com.frsummit.HRM.controller.user.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.EmergencyContact;
import com.frsummit.HRM.model.HRRecord;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.service.EmergencyContactService;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.LeaveService;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

import java.io.FileOutputStream;

public class LeavePdfDocCreate {

    private static String FILE = "C:/Users/F R Summit/Desktop/doc.pdf";

    @Autowired
    private MyAuthorization myAuthorization;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private HRRecordService hrRecordService;

    @Autowired
    private EmergencyContactService emergencyContactService;

    private int leaveId;

    @RequestMapping(value = "/print-leave-application")
    public String printLeaveApplication(){
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            document.open();

            Font headerFont=new Font(Font.FontFamily.TIMES_ROMAN,20.0f,Font.BOLD, BaseColor.BLACK);
            Paragraph header = new Paragraph("Application For Leave", headerFont);
            header.setAlignment(Element.ALIGN_CENTER);
            document.add(header);

            Font headerUserFont=new Font(Font.FontFamily.TIMES_ROMAN,20.0f, Font.NORMAL,BaseColor.BLACK);
            Paragraph headerUser = new Paragraph("(For Employer Only)", headerUserFont);
            headerUser.setAlignment(Element.ALIGN_CENTER);
            document.add(headerUser);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            Employee Details
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

            Font generalHeaderFont=new Font(Font.FontFamily.TIMES_ROMAN,20.0f, Font.BOLD,BaseColor.BLACK);
            Paragraph empDetailsHeader = new Paragraph("Employer Details", generalHeaderFont);
            document.add(empDetailsHeader);

            Font generalFont=new Font(Font.FontFamily.TIMES_ROMAN,14.0f, Font.BOLD,BaseColor.BLACK);

            Paragraph empId = new Paragraph("Employer ID                 : " + myAuthorization.userFromEmailOrId().getId(), generalFont);
            document.add(empId);

            Paragraph empName = new Paragraph("Employer Name            : " + myAuthorization.userFullName(), generalFont);
            document.add(empName);

            Paragraph empDept = new Paragraph("Employer Department : " + myAuthorization.userFromEmailOrId().getDepartment(), generalFont);
            document.add(empDept);

            Paragraph empDesg = new Paragraph("Employer Designation : " + myAuthorization.userFromEmailOrId().getDesignation(), generalFont);
            document.add(empDesg);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            Leave Request
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

            Paragraph leaveReq = new Paragraph("\nLeave Request", generalHeaderFont);
            document.add(leaveReq);

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100.0f);
//            table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 1.0f});
            table.setWidths(new int[] {20, 50});
            table.setSpacingBefore(10);

            // define font for table header row
            Font font = FontFactory.getFont(FontFactory.HELVETICA);
            font.setColor(BaseColor.BLACK);

            // define table header cell
            PdfPCell cell = new PdfPCell();
            cell.setBackgroundColor(BaseColor.WHITE);
            cell.setPadding(1);

            // write table header
            cell.setPhrase(new Phrase("Apply Date", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(getSelectedLeave().getLeaveApplyDate().toString(), font));
            table.addCell(cell);


            cell.setPhrase(new Phrase("Apply From", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(getSelectedLeave().getLeaveApplyFrom().toString(), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Apply To", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(getSelectedLeave().getLeaveApplyTo().toString(), font));
            table.addCell(cell);


            cell.setPhrase(new Phrase("Leave Type", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(getSelectedLeave().getLeaveType(), font));
            table.addCell(cell);


            cell.setPhrase(new Phrase("Leave Reason", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(getSelectedLeave().getLeaveReason(), font));
            table.addCell(cell);


            cell.setPhrase(new Phrase("Total leave days", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(String.valueOf(getSelectedLeave().getTotalDayOfLeave()), font));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Leave Description", font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(getSelectedLeave().getLeaveDescription(), font));
            table.addCell(cell);

            document.add(table);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            HR Record          //////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

            Paragraph hr = new Paragraph("\nHR Records", generalHeaderFont);
            document.add(hr);

            Paragraph hrTotalLeave = new Paragraph("Total Leave : " + getSelectedHrRecord().getTotalLeave(), generalFont);
            document.add(hrTotalLeave);

            Paragraph hrTaken = new Paragraph("Taken   : " + getSelectedHrRecord().getTotalLeaveTaken(), generalFont);
            document.add(hrTaken);

            Paragraph hrBalance = new Paragraph("Balance : " + getSelectedHrRecord().getLeaveBalance(), generalFont);
            document.add(hrBalance);

            PdfPTable hrTable = new PdfPTable(4);
            hrTable.setWidthPercentage(100.0f);
            hrTable.setWidths(new int[] {20, 15, 15, 15});
            hrTable.setSpacingBefore(10);

            // define font for table header row
            Font hrFont = FontFactory.getFont(FontFactory.HELVETICA);
            hrFont.setColor(BaseColor.BLACK);

            // define table header cell
            PdfPCell hrCell = new PdfPCell();
            hrCell.setBackgroundColor(BaseColor.WHITE);
            hrCell.setPadding(1);

            // write table header
            hrCell.setPhrase(new Phrase("Reason", hrFont));
            hrTable.addCell(hrCell);

            hrCell.setPhrase(new Phrase("Total", hrFont));
            hrTable.addCell(hrCell);

            hrCell.setPhrase(new Phrase("Taken", hrFont));
            hrTable.addCell(hrCell);

            hrCell.setPhrase(new Phrase("Remaining", hrFont));
            hrTable.addCell(hrCell);

            // write table value
            hrCell.setPhrase(new Phrase("Personal", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase(String.valueOf(getSelectedHrRecord().getTotalLeavePersonal()), hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase(String.valueOf(getSelectedHrRecord().getTotalLeaveTakenPersonal()), hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase(String.valueOf(getSelectedHrRecord().getLeaveBalancePersonal()), hrFont));
            hrTable.addCell(hrCell);

            // write table value
            hrCell.setPhrase(new Phrase("Sick", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Sick Total", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Sick Taken", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Sick Remaining", hrFont));
            hrTable.addCell(hrCell);

            // write table value
            hrCell.setPhrase(new Phrase("Sick", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Planned Total", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Planned Taken", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Planned Remaining", hrFont));
            hrTable.addCell(hrCell);

            // write table value
            hrCell.setPhrase(new Phrase("Vacation", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Vacation Total", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Vacation Taken", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Vacation Remaining", hrFont));
            hrTable.addCell(hrCell);

            // write table value
            hrCell.setPhrase(new Phrase("Maternity", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Maternity Total", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Maternity Taken", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Maternity Remaining", hrFont));
            hrTable.addCell(hrCell);

            // write table value
            hrCell.setPhrase(new Phrase("Other", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Other Total", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Other Taken", hrFont));
            hrTable.addCell(hrCell);
            hrCell.setPhrase(new Phrase("Other Remaining", hrFont));
            hrTable.addCell(hrCell);

            document.add(hrTable);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            Emergency Contact
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

            Paragraph hrContact = new Paragraph("\nEmergency Contact", generalHeaderFont);
            document.add(hrContact);

            Paragraph conName = new Paragraph("Name : ", generalFont);
            document.add(conName);

            Paragraph conPhone = new Paragraph("Phone : ", generalFont);
            document.add(conPhone);

            Paragraph conAd = new Paragraph("Address   : ", generalFont);
            document.add(conAd);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            Approve
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


            Paragraph newLine = new Paragraph("\n", generalFont);
            document.add(newLine);

            Chunk glue = new Chunk(new VerticalPositionMark());
            Paragraph p = new Paragraph(".........................");
            p.add(new Chunk(glue));
            p.add(".........................");
            p.add(new Chunk(glue));
            p.add(".........................");
            document.add(p);

            document.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return "home";
    }

    public Leaves getSelectedLeave(){
        List<Leaves> leavesList = leaveService.findLeavesByUserId(myAuthorization.userFromEmailOrId().getId());
        Leaves leaves = new Leaves();
        if(leavesList.size() != 0  && leavesList.isEmpty()){
            leaves = leavesList.get(leavesList.size()-1);
            leaveId = leaves.getId();
        }
        return leaves;
    }

    public HRRecord getSelectedHrRecord(){
        List<HRRecord> hrRecordList = hrRecordService.getAllRecord(myAuthorization.userFromEmailOrId().getId());
        HRRecord hrRecord = new HRRecord();
        if(hrRecordList.size() != 0  && hrRecordList.isEmpty()){
            hrRecord = hrRecordList.get(0);
        }
        return hrRecord;
    }
}
