package controller.user;

import javax.servlet.http.HttpSession;

public class MemberSessionUtils {
    public static final String USER_SESSION_KEY = "id";

    /* 현재 로그인한 사용자의 ID를 구함 */
    public static String getLoginId(HttpSession session) {
        String id = (String)session.getAttribute(USER_SESSION_KEY);
        return id;
    }

    /* 로그인한 상태인지를 검사 */
    public static boolean hasLogined(HttpSession session) {
        if (getLoginId(session) != null) {
            return true;
        }
        return false;
    }

    /* 현재 로그인한 사용자의 ID가 userId인지 검사 */
    public static boolean isLoginMember(String id, HttpSession session) {
        String loginMember = getLoginId(session);
        if (loginMember == null) {
            return false;
        }
        return loginMember.equals(id);
    }
}
