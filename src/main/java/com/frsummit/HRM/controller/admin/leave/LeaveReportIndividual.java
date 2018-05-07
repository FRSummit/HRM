package com.frsummit.HRM.controller.admin.leave;

import com.frsummit.HRM.configuration.MyAuthorization;
import com.frsummit.HRM.model.Leaves;
import com.frsummit.HRM.model.User;
import com.frsummit.HRM.service.HRRecordService;
import com.frsummit.HRM.service.LeaveService;
import com.frsummit.HRM.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.List;

@Controller
public class LeaveReportIndividual {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private HRRecordService hrRecordService;

    @Autowired
    private MyAuthorization myAuthorization;

    @RequestMapping(value = "/admin/leave-record-individual", method = RequestMethod.GET)
    public String getLeaveReportIndividual(@RequestParam(value = "userId")String userId, Model model){
        User user = userService.findUserById(userId);
        if(user != null){
            String fullName = user.getFirstName() + " " + user.getMiddleName() + " " + user.getLastName();
            model.addAttribute("fullName", fullName);
            model.addAttribute("userId", userId);
            model.addAttribute("department", user.getDepartment());
            model.addAttribute("designation", user.getDesignation());
            model.addAttribute("year", Calendar.getInstance().get(Calendar.YEAR));
            model.addAttribute("febthirty", "#");
            model.addAttribute("febthirtyone", "#");
            model.addAttribute("aprthirtyone", "#");
            model.addAttribute("junthirtyone", "#");
            model.addAttribute("septhirtyone", "#");
            model.addAttribute("novthirtyone", "#");

            String[] months =  {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
            String[] days = {"one", "two", "three", "four", "five",
                    "six", "seven", "eight", "nine", "ten",
                    "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                    "sixteen", "seventeen", "eighteen", "nineteen", "twenty",
                    "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive",
                    "twentysix", "twentyseven", "twentyeight", "twentynine", "thirty", "thirtyone"};


            List<Leaves> leavesList =  leaveService.findLeavesByUserId(userId);
            if(leavesList.size() > 0){
                for(int i=0; i<leavesList.size(); i++){
                    Leaves leaves = leavesList.get(i);
                    System.out.println("Leave : " + leaves.getId());

                    System.out.println(leaves.getLeaveApplyFrom());
                    System.out.println(leaves.getLeaveApplyTo());

                    String[] partsLeaveFrom = leaves.getLeaveApplyFrom().toString().split("-");
                    String[] partsLeaveTo = leaves.getLeaveApplyTo().toString().split("-");

//                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
//                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
//                    System.out.println("Days " + partsLeaveFromday[0] + " " + partsLeaveToday[0]);

                    int currentYear = Calendar.getInstance().get(Calendar.YEAR);

                    //In the year
                    if(partsLeaveFrom[0].equalsIgnoreCase(String.valueOf(currentYear)) && partsLeaveTo[0].equalsIgnoreCase(String.valueOf(currentYear))){
                        for(int m=1; m<=12; m++){
//                            In the same month
                            if(Integer.parseInt(partsLeaveFrom[1]) == m && Integer.parseInt(partsLeaveTo[1]) == m){
                                System.out.println(months[m-1]);
                                for(int mon=m; mon<=m; mon++){
                                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
                                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
                                    int from = Integer.parseInt(partsLeaveFromday[0]);
                                    int to = Integer.parseInt(partsLeaveToday[0]);
                                    for(int day=from-1; day<=to-1; day++){
                                        model.addAttribute(months[mon-1]+days[day], "Y");
                                    }
                                }
                            }
//                            Between two months
                            if(Integer.parseInt(partsLeaveFrom[1]) == m && Integer.parseInt(partsLeaveTo[1]) == m+1){
                                System.out.println(months[m-1] + " " + months[m]);
//                                First month
                                for(int mon=m; mon<=m; mon++){
                                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
                                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
                                    int from = Integer.parseInt(partsLeaveFromday[0]);
                                    int to = Integer.parseInt(partsLeaveToday[0]);
                                    System.out.println(from + " " + to + "    " + days.length);
//                                    for(int day=from-1; day<=to-1; day++){
//                                        model.addAttribute(months[mon-1]+days[day], "Y");
//                                    }

                                    for (int day = from - 1; day < days.length; day++) {
                                        model.addAttribute(months[mon - 1] + days[day], "Y");
                                    }
                                    if(months[mon-1] == "apr" || months[mon-1] == "jun" || months[mon-1] == "sep" ||months[mon-1] == "nov")
                                        model.addAttribute(months[mon-1]+"thirtyone", "#");
                                    if(months[mon-1] == "feb"){
                                        model.addAttribute(months[mon-1]+"thirty", "#");
                                        model.addAttribute(months[mon-1]+"thirtyone", "#");
                                    }
                                }
//                                Second month
                                for(int mon=m+1; mon<=m+1; mon++){
                                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
                                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
                                    int from = Integer.parseInt(partsLeaveFromday[0]);
                                    int to = Integer.parseInt(partsLeaveToday[0]);
                                    System.out.println(from + " " + to + "    " + days.length);

                                    for (int day = 0; day < to; day++) {
                                        model.addAttribute(months[mon - 1] + days[day], "Y");
                                    }

                                    if(months[mon-1] == "apr" || months[mon-1] == "jun" || months[mon-1] == "sep" ||months[mon-1] == "nov")
                                        model.addAttribute(months[mon-1]+"thirtyone", "#");
                                    if(months[mon-1] == "feb"){
                                        model.addAttribute(months[mon-1]+"thirty", "#");
                                        model.addAttribute(months[mon-1]+"thirtyone", "#");
                                    }
                                }
                            }
//                            i don't know wtf is this, i forget
                            if(Integer.parseInt(partsLeaveFrom[1]) == m && Integer.parseInt(partsLeaveTo[1]) == m-11){
                                System.out.println(months[m-1] + " " + months[m-11]);
                                for(int mon=m; mon<=m; mon++){
                                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
                                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
                                    int from = Integer.parseInt(partsLeaveFromday[0]);
                                    int to = Integer.parseInt(partsLeaveToday[0]);
                                    for(int day=from-1; day<=to-1; day++){
                                        model.addAttribute(months[mon-1]+days[day], "Y");
                                    }
                                }
                            }
                        }

                    }

//                    Between two years (december & january) curent year and next year
                    if(partsLeaveFrom[0].equalsIgnoreCase(String.valueOf(currentYear)) && partsLeaveTo[0].equalsIgnoreCase(String.valueOf(currentYear+1))){
                        for(int m=1; m<=12; m++){
                            if(Integer.parseInt(partsLeaveFrom[1]) == m && Integer.parseInt(partsLeaveTo[1]) == m-11){
                                System.out.println(months[m-1] + " " + months[m-12]);
                                for(int mon=m; mon<=m; mon++){
                                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
                                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
                                    int from = Integer.parseInt(partsLeaveFromday[0]);
                                    int to = Integer.parseInt(partsLeaveToday[0]);
                                    for(int day=from-1; day<days.length; day++){
                                        model.addAttribute(months[mon-1]+days[day], "Y");
                                    }
                                }
                            }
                        }

                    }

//                    Between two years (december & january) previous year and current year
                    if(partsLeaveFrom[0].equalsIgnoreCase(String.valueOf(currentYear-1)) && partsLeaveTo[0].equalsIgnoreCase(String.valueOf(currentYear))){
                        for(int m=1; m<=12; m++){
                            if(Integer.parseInt(partsLeaveFrom[1]) == m && Integer.parseInt(partsLeaveTo[1]) == m-11){
                                System.out.println(months[m-1] + " " + months[m-12]);
                                for(int mon=m; mon<=m; mon++){
                                    String[] partsLeaveFromday = partsLeaveFrom[2].split(" ");
                                    String[] partsLeaveToday = partsLeaveTo[2].split(" ");
                                    int from = Integer.parseInt(partsLeaveFromday[0]);
                                    int to = Integer.parseInt(partsLeaveToday[0]);
                                    for(int day=0; day<to; day++){
                                        model.addAttribute(months[mon-12]+days[day], "Y");
                                    }
                                }
                            }
                        }

                    }
                }
            }


            /*model.addAttribute("one", );
            model.addAttribute("two", );
            model.addAttribute("three", );
            model.addAttribute("four", );
            model.addAttribute("five", );
            model.addAttribute("six", );
            model.addAttribute("seven", );
            model.addAttribute("eight", );
            model.addAttribute("nine", );
            model.addAttribute("ten", );
            model.addAttribute("eleven", );
            model.addAttribute("twelve", );
            model.addAttribute("thirteen", );
            model.addAttribute("fourteen", );
            model.addAttribute("fifteen", );
            model.addAttribute("sixteen", );
            model.addAttribute("seventeen", );
            model.addAttribute("eighteen", );
            model.addAttribute("nineteen", );
            model.addAttribute("twenty", );
            model.addAttribute("twentyone", );
            model.addAttribute("twentytwo", );
            model.addAttribute("twentythree", );
            model.addAttribute("twentyfour", );
            model.addAttribute("twentyfive", );
            model.addAttribute("twentysix", );
            model.addAttribute("twentyseven", );
            model.addAttribute("twentyeight", );
            model.addAttribute("twentynine", );
            model.addAttribute("thirty", );
            model.addAttribute("thirtyone", );*/






        }else{
            model.addAttribute("fullName", "Wrong User Id");
        }
        return "leaves-report-individual";
    }

    public int leapYear(int year){
        if(year%4==0 && year%100!=0 || year%400==0)
            return year;
        return 0;
    }

    public void myFn(){
        String[] months =  {"jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
        String[] days = {"one", "two", "three", "four", "five",
                "six", "seven", "eight", "nine", "ten",
                "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                "sixteen", "seventeen", "eighteen", "nineteen", "twenty",
                "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive",
                "twentysix", "twentyseven", "twentyeight", "twentynine", "thirty", "thirtyone"};
        System.out.println(months.length);
        System.out.println(days.length);
    }

    public void myFun(Model model){

//        January
        /*model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        February
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        March
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        April
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        May
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        June
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        July
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        August
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        September
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        October
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        November
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );

//        Decenber
        model.addAttribute("one", );
        model.addAttribute("two", );
        model.addAttribute("three", );
        model.addAttribute("four", );
        model.addAttribute("five", );
        model.addAttribute("six", );
        model.addAttribute("seven", );
        model.addAttribute("eight", );
        model.addAttribute("nine", );
        model.addAttribute("ten", );
        model.addAttribute("eleven", );
        model.addAttribute("twelve", );
        model.addAttribute("thirteen", );
        model.addAttribute("fourteen", );
        model.addAttribute("fifteen", );
        model.addAttribute("sixteen", );
        model.addAttribute("seventeen", );
        model.addAttribute("eighteen", );
        model.addAttribute("nineteen", );
        model.addAttribute("twenty", );
        model.addAttribute("twentyone", );
        model.addAttribute("twentytwo", );
        model.addAttribute("twentythree", );
        model.addAttribute("twentyfour", );
        model.addAttribute("twentyfive", );
        model.addAttribute("twentysix", );
        model.addAttribute("twentyseven", );
        model.addAttribute("twentyeight", );
        model.addAttribute("twentynine", );
        model.addAttribute("thirty", );
        model.addAttribute("thirtyone", );*/
    }
}
