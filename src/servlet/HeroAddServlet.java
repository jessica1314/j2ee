package servlet;

import bean.Hero;
import com.alibaba.fastjson.JSONObject;
import dao.HeroDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HeroAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String data = req.getParameter("data");
        System.out.println(data);
        Hero hero1;
        if (data != null) {
            hero1 = JSONObject.parseObject(data, Hero.class);
        } else {
            hero1 = new Hero();
            String name = req.getParameter("name");
            String hp = req.getParameter("hp");
            String damage = req.getParameter("damage");
            hero1.setName(name);
            hero1.setHp(Float.parseFloat(hp));
            hero1.setDamage(Integer.parseInt(damage));
        }
        System.out.println("name:" + hero1.getName() + ",hp:" + hero1.getHp() + ",damage:" + hero1.getDamage());
        new HeroDAO().add(hero1);
        resp.sendRedirect("/listHero");
//        JSONObject jj = new JSONObject();
//        JSONObject jj1 = new JSONObject();
//        jj1.put("key", 1);
//        jj1.put("value", 2);
//        jj.put("data", jj1);
//        resp.getWriter().println(jj);
//        ArrayList<Hero> heroes = new ArrayList<>();
//        for (int i = 0; i < 10; i++) {
//            Hero hero = new Hero();
//            hero.setId(i);
//            hero.setName("hero" + i);
//            hero.setHp(i);
//            hero.setDamage((int) (100.0f + i));
//            heroes.add(hero);
//        }
//        resp.getWriter().print(JSONObject.toJSON(heroes));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    public static void main(String[] args) {

    }
}
