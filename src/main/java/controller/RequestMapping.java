package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.*;
import controller.mentoring.MentoringApplyController;
import controller.mentoring.MentoringCancelApplyController;
import controller.mentoring.MentoringListController;
import controller.mentoring.MentoringRegisterController;
import controller.mentoring.MentoringUnregisterController;
import controller.study.ListStudyController;
import controller.study.StudyApplyController;
import controller.study.StudyCancelApplyController;
import controller.study.StudyRegisterController;
import controller.study.StudyUnregisterController;
import controller.user.ApplyController;
import controller.user.ListController;
import controller.user.LoginController;
import controller.user.RegisterController;
import controller.user.RegisterUserController;
import controller.user.ScoreController;
import controller.user.UpdateUserController;
import controller.user.UpdateUserFormController;


public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
    	mappings.put("/", new ForwardController("index.jsp"));
    	
    	//스터디
    	mappings.put("/study", new ForwardController("/study/studyRegisterForm.jsp"));
    	mappings.put("/study/Register", new StudyRegisterController());   
    	mappings.put("/study/list", new ListStudyController());
    	mappings.put("/study/studyApply", new StudyApplyController());
    	mappings.put("/study/Unregister", new StudyUnregisterController());
    	mappings.put("/study/Cancel/studyApply", new StudyCancelApplyController());
    	
    	//멘토링
    	mappings.put("/mentoring", new ForwardController("/mentoring/mentoringRegisterForm.jsp"));
        mappings.put("/mentoring/Register", new MentoringRegisterController());
        mappings.put("/mentoring/list", new MentoringListController()); 
        mappings.put("/mentoring/mentoringApply", new MentoringApplyController());
        mappings.put("/mentoring/Unregister", new MentoringUnregisterController());
        mappings.put("/mentoring/Cancel/mentoringApply", new MentoringCancelApplyController());
        
        //유저
        mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
        mappings.put("/user/register", new RegisterUserController());
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/list", new ListController());     
        mappings.put("/user/update/form", new UpdateUserFormController());
        mappings.put("/user/update", new UpdateUserController());
        mappings.put("/user/img", new RegisterController());
        mappings.put("/user/apply", new ApplyController());
        mappings.put("/user/rating", new ScoreController());
        mappings.put("/user/logout", new ForwardController("/member/logout.jsp"));
        
        //뷰
    	mappings.put("/view/main", new ViewMainController());
        mappings.put("/view/search", new SearchResultController());
        
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}
