package listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionAttributeSetter implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        session.setAttribute("role", null); // 设置默认权限为null
        session.setAttribute("id", null);    // 设置默认登录ID为-1
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
