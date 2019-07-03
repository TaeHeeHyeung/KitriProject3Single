package backup;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kitri.single.user.model.UserDto;
import com.kitri.single.user.service.UserService;
import com.kitri.single.user.service.UserServiceImpl;

//@Controller
//@RequestMapping("/user")
public class UserControllerBackupmail {
//	@Inject
//    private JavaMailSender mailSender;
//    
//    @Inject    
//	UserService userService;
//	
//	private Logger logger =LoggerFactory.getLogger(UserControllerBackupmail.class);
//
//	@RequestMapping("/home")
//	public void home() {
//		System.out.println("home 들어옴");
//	}
//	
//    //회원가입
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String RegisterPost(UserDto user,Model model,RedirectAttributes rttr) throws Exception{
//        System.out.println("regesterPost 진입 ");
//        userService.regist(user);
//        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
//        return "redirect:/";
//    }
//	
//	//이메일 인증 코드 검증
//    @RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
//    public String emailConfirm(UserDto user,Model model,RedirectAttributes rttr) throws Exception { 
//        System.out.println("cont get user"+user);
//        if(user == null) {
//            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
//            return "redirect:/";
//        }
//        //System.out.println("usercontroller vo =" +vo);
//        model.addAttribute("userInfo",user);
//        return "/user/emailConfirm";
//    }
//    


 
}
