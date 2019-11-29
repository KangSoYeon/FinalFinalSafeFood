package com.ssafy.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.cache.CacheException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.MemberException;
import com.ssafy.model.dto.MyDiet;
import com.ssafy.model.dto.PageBean;
import com.ssafy.model.dto.Search;
import com.ssafy.model.dto.TotalDiet;
import com.ssafy.model.service.MemberService;
import com.ssafy.model.service.MyDietService;
import com.ssafy.model.service.SearchService;
import com.ssafy.util.PageUtility;
import com.ssafy.model.dto.Cart;
import com.ssafy.model.dto.Food;
import com.ssafy.model.service.CartService;
import com.ssafy.model.service.FoodService;

/**
 * Servlet implementation class MainServlet
 */
@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private MyDietService mydietService;
	@Autowired
	private CartService cartService;
	@Autowired
	private SearchService searchService;
	
	//몸무게별 운동시 소모 칼로리 (단위 10분)
	static int[][] calbyExer = {
	//달리기, 계단오르기, 자전거, 배드민턴, 빨리 걷기
	{94, 59, 44, 44, 54 },//55~65kg
	{110, 69, 51, 51, 64 }, //65~75kg
	{126, 78, 59, 59, 73 }, //75~85kg
	{146, 88, 66, 66, 82} //85kg~

	};
	//성별별 하루 권장 섭취량
	static int[][] recommendNut = {
	{2600, 410, 55, 58, 12 , 1500, 150,25,25 }, //male
	{2100, 330, 50, 47, 12, 1500, 150,25,25 } //female
	};

	@ExceptionHandler
	public ModelAndView handle(Exception e) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("ErrorHandler");
		return mav;
	}
	
	@GetMapping("detailform.do")
	public String detailform(HttpServletRequest request) {
		String code = request.getParameter("code");
		String msg = request.getParameter("msg");
		Food food = foodService.search(code);
		request.setAttribute("food", food);
		request.setAttribute("msg",msg);
		if(getId(request)!=null) {
			String id = getId(request);
			Member member = memberService.search(id);
			request.setAttribute("member", member);
		}
		return "detail";
	}
	@GetMapping("loginform.do")
	public String loginform() {
		return "login";
	}
	
	@GetMapping("signUpform.do")
	public String signUpform() {
		return "signUp";
	}
	
	// 베스트 섭취 정보 처리
	@GetMapping("best.do")
	public String bestform(HttpServletRequest request, HttpServletRequest response) {
		List<TotalDiet> bes = mydietService.best();
		List<Food> allL = new LinkedList<>();
		List<Food> list = null; 
		for(int i=0; i<bes.size(); i++) {
			list = foodService.searchAllName(bes.get(i).getName()); //하나의 이름으로 검색한 결과 해당 이름으로 추가하기 
			for(int j=0; j<list.size(); j++) { //전체 결과에 추가 
				allL.add(list.get(j));
			}
		}
		
		request.setAttribute("list", allL);
		return "best";
	}
	
	// 관리자 전용 상품 추가 폼 이동
	@GetMapping("addfoodform.do")
	public String addfoodform(HttpServletRequest request) {
		List<Food> list = foodService.searchAll();
		int size = list.size();
		request.setAttribute("code", size+1);
		String msg = request.getParameter("msg");
		request.setAttribute("msg", msg);
		return "addfood";
	}
	
	// 관리자 전용 상품 수정 폼 이동
	@GetMapping("modifyform.do")
	public String modifyform(HttpServletRequest request){
		String code = request.getParameter("code");
		Food food = foodService.search(code);
		request.setAttribute("food", food);
		return "modify_food";
	}
	
	@PostMapping("modify.do")
	public String modify(HttpServletRequest request,Food food) {
		try {
			String dir = request.getRealPath("/");
			food.setDir(dir);
//			if(food.getFileup()==null)
			foodService.update(food);
			return "redirect:index.do";
		} catch (Exception e) {
			e.printStackTrace();
			String msg="";
			try {
				msg = URLEncoder.encode(e.getMessage(), "UTF-8");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return "redirect:modifyform.do?code="+food.getCode()+"msg="+msg;
		}
	}
	
	// 상품 추가 기능
	@PostMapping("addfood.do")
	public String addfood(Food food, HttpServletRequest request) {
		try {
			String dir = request.getRealPath("/");
			food.setDir(dir);
			foodService.insert(food);
			return "redirect:index.do";
		} catch (Exception e) {
			e.printStackTrace();
			String msg="";
			try {
				msg = URLEncoder.encode(e.getMessage(), "UTF-8");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return "redirect:addfoodform.do?msg="+msg;
		}
	}
	
	// 상품 삭제 기능
	@PostMapping("deletefood.do")
	public String delfood(HttpServletRequest request) {
		String code = request.getParameter("Fcode");
		foodService.delete(code);
		return "redirect:index.do";
	}
	
	//회원 정보 창
	@GetMapping("meminfo.do")
	public String memInfo(HttpServletRequest request) {
		String id = getId(request);
		
		Member mem = memberService.search(id);
		request.setAttribute("member", mem);
		return "memberInfo";
	}

	// 비밀번호 찾기 폼 이동
	@GetMapping("findpasswordForm.do")
	public String findpasswordForm() {
		return "findPassword";
	}

	// 회원 삭제 기능
	@PostMapping("delete.do")
	private String delete(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("id",null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		String id = request.getParameter("id");
		memberService.delete(id);
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.do";
	}
	
	// 회원 정보 수정 기능
	@PostMapping("update.do")
	private String update(HttpServletRequest request, HttpServletResponse response, Member member) {
		int[] alergy = new int[14];
		alergy[0] = member.getDu();
		alergy[1] = member.getCong();
		alergy[2] = member.getMilk();
		alergy[3] = member.getCrab();
		alergy[4] = member.getShi();
		alergy[5] = member.getTu();
		alergy[6] = member.getSal();
		alergy[7] = member.getSuk();
		alergy[8] = member.getCow();
		alergy[9] = member.getChi();
		alergy[10] = member.getPig();
		alergy[11] = member.getPeach();
		alergy[12] = member.getMind();
		alergy[13] = member.getEgg();
		addToSession(request, "al", alergy);
		memberService.update(member);
		String pid = getId(request);
		request.setAttribute("member", memberService.search(pid));
		return "redirect:index.do";
	}

	@PostMapping("sign.do")
	private String sign(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String weight = request.getParameter("weight");
		int du = request.getParameter("du") == null ? 0 : 1;
		int cong = request.getParameter("cong") == null ? 0 : 1;
		int milk = request.getParameter("milk") == null ? 0 : 1;
		int crab = request.getParameter("crab") == null ? 0 : 1;
		int shi = request.getParameter("shi") == null ? 0 : 1;
		int tu = request.getParameter("tu") == null ? 0 : 1;
		int sal = request.getParameter("sal") == null ? 0 : 1;
		int suk = request.getParameter("suk") == null ? 0 : 1;
		int cow = request.getParameter("cow") == null ? 0 : 1;
		int chi = request.getParameter("chi") == null ? 0 : 1;
		int pig = request.getParameter("pig") == null ? 0 : 1;
		int peach = request.getParameter("peach") == null ? 0 : 1;
		int mind = request.getParameter("mind") == null ? 0 : 1;
		int egg = request.getParameter("egg") == null ? 0 : 1;

		Member member = new Member(id, pw, name, email, gender, weight, du, cong, milk, crab, shi, tu, sal, suk, cow,
				chi, pig, peach, mind, egg);
		try {
			if(id=="") {
				throw new MemberException("아이디를 입력해주세요");
			}
			if(pw=="") {
				throw new MemberException("비밀번호를 입력해주세요");
			}
			memberService.insert(member);
			return "redirect:index.do";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "signUp";
		}
		
	}
	
	// 로그아웃 기능 ( 세션 저장 값 초기화 )
	@GetMapping("logout.do")
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("al");
		return "redirect:index.do";
	}
	
	// QnA 게시판 이동 폼
	@GetMapping("qna.do")
	private String qna() {
		return "QnA";
	}
	
	// 공지사항 게시판 이동 폼
	@GetMapping("notice.do")
	private String notice() {
		return "notice";
	}
	
	// 찜으로 추가된 예상 섭취 정보 삭제 기능
	@GetMapping("deletecart.do")
	private String deletecart(HttpServletRequest request) {
		int pageno = Integer.parseInt(request.getParameter("pageNumber"));
		int cno  = Integer.parseInt(request.getParameter("cno"));
		String day = request.getParameter("day");
		String msg = "";
		try {
			cartService.delete(cno, request);
			msg = "삭제 성공";
			msg = URLEncoder.encode(msg,"UTF-8");
			day = URLEncoder.encode(day, "UTF-8");
			if(pageno==0) pageno=1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new CacheException("찜 식품 삭제 중 오류 발생");
		}
		return "redirect:expect.do?msg="+msg+"&pageNumber="+pageno+"&day="+day;
	}
	
	// 추가로 추가된 내 섭취 정보 삭제 기능
	@GetMapping("deletediet.do")
	private String deletediet(HttpServletRequest request) {
		int pageno = Integer.parseInt(request.getParameter("pageNumber"));
		int dno  = Integer.parseInt(request.getParameter("dno"));
		String day = request.getParameter("day");
		String msg = "";
		try {
			mydietService.delete(dno, request);
			msg = "삭제 성공";
			msg = URLEncoder.encode(msg,"UTF-8");
			day = URLEncoder.encode(day, "UTF-8");
			if(pageno==0) pageno=1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new CacheException("추가 식품 삭제 중 오류 발생");
		}
		return "redirect:myeat.do?msg="+msg+"&pageNumber="+pageno+"&day="+day;
	}
	
	// 예상 섭취 정보 출력 기능
	@GetMapping("expect.do")
	private String expect(HttpServletRequest request, HttpServletResponse response) {
		String id = getId(request);
		String msg = request.getParameter("msg");
		String day = request.getParameter("day");
		request.setAttribute("msg", msg);
		
		String pageNo = request.getParameter("pageNumber");
		int pno = Integer.parseInt(pageNo);
		request.setAttribute("pageNumber",pageNo);
		
		PageBean bean = new PageBean(pageNo);
		int interval = bean.getInterval();
		
		List<MyDiet> tmp = null;
		List<Cart> carts = null;
		if(day.equals("1")) {
			tmp = mydietService.week(id);
			carts = cartService.week(id);
		}else if(day.equals("2")) {
			tmp = mydietService.month(id);
			carts = cartService.month(id);
		}else if(day.equals("3")){
			tmp = mydietService.year(id);
			carts = cartService.year(id);
		}else {
			tmp = mydietService.search(id);
			carts = cartService.search(id);
		}
		
		//1-1.영양정보별로 더해서 리스트	섭취 영양성분
		int[] eat = new int[10];
		for(int i=0; i<tmp.size(); i++) {
			MyDiet md = tmp.get(i);
			Food f = md.getFood();
			int amnt = md.getAmount();
			eat[0] += f.getSupportpereat()*amnt;
			eat[1] += f.getCalory()*amnt;
			eat[2] += f.getCarbo()*amnt;
			eat[3] += f.getProtein()*amnt;
			eat[4] += f.getFat()*amnt;
			eat[5] += f.getSugar()*amnt;
			eat[6] += f.getNatrium()*amnt;
			eat[7] += f.getChole()*amnt;
			eat[8] += f.getFattyacid()*amnt;
			eat[9] += f.getTransfat()*amnt;
		}
//		for (int i = 0; i < eat.length; i++) {
//			eat[i] = Double.parseDouble(String.format("%.1f", eat[i]));
//		}
		//1-2.영양정보별로 더해서 리스트	예상 섭취 영양성분
		int[] nut = new int[10];
		for(int i=0; i<carts.size(); i++) {
			Cart ct = carts.get(i);
			Food f = ct.getFood();
			int amnt = ct.getAmount();
			nut[0] += f.getSupportpereat()*amnt;
			nut[1] += f.getCalory()*amnt;
			nut[2] += f.getCarbo()*amnt;
			nut[3] += f.getProtein()*amnt;
			nut[4] += f.getFat()*amnt;
			nut[5] += f.getSugar()*amnt;
			nut[6] += f.getNatrium()*amnt;
			nut[7] += f.getChole()*amnt;
			nut[8] += f.getFattyacid()*amnt;
			nut[9] += f.getTransfat()*amnt;
		}
		
		List<TotalDiet> tod = mydietService.total(id);
		
		//2. 이름별, 수량 더해서 리스트		섭취 내역
		List<String[]> arr = new ArrayList<>(interval);
		
		int size = (pno-1)*interval + interval;
		int index = 0;
		for (int i = (pno-1)*interval ; i < size; i++) {
			if(i==tod.size()) break;
			TotalDiet tmpDiet = tod.get(i);
			arr.add(index++,new String[] {tmpDiet.getName(),tmpDiet.getAmount()});
		}
        
		int total = tod.size();
		PageUtility bar = new PageUtility(bean.getInterval()
				, total, bean.getPageNo(), "images/");
		bean.setPageLink(bar.getPageBar());
		
		request.setAttribute("bean",bean);
		
		request.setAttribute("n1", nut);
		request.setAttribute("e1", eat);
		request.setAttribute("n2", arr);
		request.setAttribute("n3", carts);
		request.setAttribute("day", day);
		return "cart";
	}
	
	// 내 섭취 정보 출력 기능
	@GetMapping("myeat.do")
	private String myeat(HttpServletRequest request, HttpServletResponse response) {
		String id = getId(request);
		String msg = request.getParameter("msg");
		String day = request.getParameter("day");
		Member member = memberService.search(id);
		request.setAttribute("msg", msg);
		
		String pageNo = request.getParameter("pageNumber");
		int pno = Integer.parseInt(pageNo);
		request.setAttribute("pageNumber",pageNo);
		
		PageBean bean = new PageBean(pageNo);
		int interval = bean.getInterval();
		
		List<MyDiet> tmp = null;
		if(day.equals("1")) {
			tmp = mydietService.week(id);
		}else if(day.equals("2")) {
			tmp = mydietService.month(id);
		}else if(day.equals("3")){
			tmp = mydietService.year(id);
		}else {
			tmp = mydietService.search(id);
		}
		ArrayList<MyDiet> diets = new ArrayList<>(interval);
		int size = (pno-1)*interval + interval;
		for (int i = (pno-1)*interval; i < size; i++) {
			if(i==tmp.size()) break;
			diets.add(tmp.get(i));
		}
		
		int total = tmp.size();
		PageUtility bar = new PageUtility(bean.getInterval()
				, total, bean.getPageNo(), "images/");
		bean.setPageLink(bar.getPageBar());
		
		request.setAttribute("bean",bean);
		//1-1.영양정보별로 더해서 리스트	섭취 영양성분
		int[] eat = new int[10];
		for(int i=0; i<tmp.size(); i++) {
			MyDiet md = tmp.get(i);
			Food f = md.getFood();
			int amnt = md.getAmount();
			eat[0] += f.getSupportpereat()*amnt;
			eat[1] += f.getCalory()*amnt;
			eat[2] += f.getCarbo()*amnt;
			eat[3] += f.getProtein()*amnt;
			eat[4] += f.getFat()*amnt;
			eat[5] += f.getSugar()*amnt;
			eat[6] += f.getNatrium()*amnt;
			eat[7] += f.getChole()*amnt;
			eat[8] += f.getFattyacid()*amnt;
			eat[9] += f.getTransfat();
		}
//		for (int i = 0; i < eat.length; i++) {
//			eat[i] = Double.parseDouble(String.format("%.1f", eat[i]));
//		}
		
		
		List<TotalDiet> tod = mydietService.total(id);
		
		//2. 이름별, 수량 더해서 리스트		섭취 내역
		
		List<String[]> arr = new LinkedList<>();
		int index = 0;
		for (int i = 0; i < tod.size(); i++) {
			TotalDiet tmpDiet = tod.get(i);
			arr.add(index++, new String[] {tmpDiet.getName(),tmpDiet.getAmount()});
		}
		
		int w = Integer.parseInt(member.getWeight());
		int [] wk = new int[5];
		int widx = 0;
		if(w<65) {
			wk = calbyExer[0];
			widx = 0;
		}else if(w >= 65 && w < 75) {
			wk = calbyExer[1];
			widx = 1;
		}else if(w>=75 && w < 85) {
			wk = calbyExer[2];
			widx = 2;
		}else {
			wk = calbyExer[3];
			widx = 3;
		}
		
		int[] calwk = new int[5];
		for (int i = 0; i < calwk.length; i++) {
			if(eat[0]<1) {
				calwk[i] = 0;
			}else {
				calwk[i] = eat[0]/wk[i];
				if(calwk[i]<1) calwk[i] = 10;
				else calwk[i] *= 10;
			}
		}
		
		int[] reco = new int[9];
		if(member.getGender().equals("1")) {
			reco = recommendNut[0];
		}else { reco = recommendNut[1]; }
		
		request.setAttribute("recomend",reco);
		request.setAttribute("mw",widx);
		request.setAttribute("exer",calwk);
		request.setAttribute("member",member);
		request.setAttribute("e1", eat);
		request.setAttribute("n2", arr);
		request.setAttribute("n3", diets);
		request.setAttribute("day", day);
		return "myeat";
	}
	
	// 관리자 전용 회원 관리 폼 이동
	@GetMapping("adminmem.do")
	private String adminmem(HttpServletRequest request) {
		List<Member> list = memberService.searchAll();
		request.setAttribute("list", list);
		return "manage_mem";
	}
	
	// 관리자 전용 회원 관리 삭제 기능
	@GetMapping("delmem.do")
	private String deletemem(HttpServletRequest request) {
		String id = request.getParameter("id");
		if(id!=null) memberService.delete(id);
		return "redirect:adminmem.do";
	}
	
	// 로그인 기능 ( 아이디 및 비밀번호 확인 후 로그인 처리 )
	@PostMapping("login.do")
	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String idsave = request.getParameter("idsave");
		String referer = request.getParameter("referer");

		Cookie cookie = new Cookie("id", id);
		if (idsave != null) {
			cookie.setMaxAge(10000000);
		} else {
			cookie.setMaxAge(0);
		}
		
		response.addCookie(cookie);
		try {
			memberService.login(id, pw);
			Member member = memberService.search(id);
			int[] alergy = new int[14];
			alergy[0] = member.getDu();
			alergy[1] = member.getCong();
			alergy[2] = member.getMilk();
			alergy[3] = member.getCrab();
			alergy[4] = member.getShi();
			alergy[5] = member.getTu();
			alergy[6] = member.getSal();
			alergy[7] = member.getSuk();
			alergy[8] = member.getCow();
			alergy[9] = member.getChi();
			alergy[10] = member.getPig();
			alergy[11] = member.getPeach();
			alergy[12] = member.getMind();
			alergy[13] = member.getEgg();
			addToSession(request, "id", id);
			addToSession(request, "al", alergy);
			if (referer != null) {
				return referer;
			} else {
				return "redirect:index.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "login";
		}
	}

	// 비밀번호 찾기 찾기 기능
	@PostMapping("findpassword.do")
	private String findpw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		try {
			if(id=="") {
				throw new MemberException("아이디를 입력해주세요.");
			}else {
				Member member = memberService.search(id);
				request.setAttribute("findpw", member);
				return "findPassword";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "findPassword";
		}
		
	}
	
	// 검색창 기능
	@PostMapping("search.do")
	private String searchAllFood(HttpServletRequest request, HttpServletResponse response) {
		String option = request.getParameter("droplist");
		String searchbar = request.getParameter("searchbar");
		List<Food> list = null;

		request.setAttribute("droplist", option);
		request.setAttribute("searchbar", searchbar);
		if (option.equals("1")) {
			list = foodService.searchAllName(searchbar);
		} else if (option.equals("2")) {
			list = foodService.searchAllMaker(searchbar);
		} else if (option.equals("3")) {
			list = foodService.searchAllMaterial(searchbar);
		} else {
			list = foodService.searchAll();
		}
		
		Search st = searchService.search(searchbar);
		int opt = Integer.parseInt(option);
		if(opt!=0) { 
			if(st==null) {
				st = new Search(searchbar,1,opt);
			}
			searchService.update(st,searchbar);
		}
		
//		List<Search> slist =  searchService.searchAll();
//		
//		// value 내림차순으로 정렬하고, value가 같으면 key 오름차순으로 정렬
//        Collections.sort(slist, new Comparator<Search>() {
//			@Override
//			public int compare(Search a0, Search a1) {
//				// TODO Auto-generated method stub
//				return a1.getScnt()-a0.getScnt();
//			}
//		});
       
		Collections.sort(list);
		request.setAttribute("list", list);
//		request.setAttribute("slist",slist);
		return "index";
	}
	
	// 상품 목록을 불러오는 초기화면 
	@GetMapping("index.do")
	private String listFood(HttpServletRequest request, HttpServletResponse response) {
		List<Food> list = foodService.searchAll();
		Collections.sort(list);
		request.setAttribute("list", list);
		return "index";
	}
	
	
	// 상품 정보에서 추가기능, 추가 버튼 ( 내 섭취 정보 )
	@PostMapping("addmydiet.do")
	private String addMydiet(HttpServletRequest request, HttpServletResponse response) {

		String amount = request.getParameter("cnt"); //추가 수량 가져오기
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String current = format.format(time);
		
		MyDiet mydiet = new MyDiet();
		String code = request.getParameter("Fcode");
		String msg="";
		String id = getId(request);
		int cnt = Integer.parseInt(amount);
		
		if(id==null) {
			msg = "로그인을 해주세요.";
		}else if(cnt>0 && code != null && current != null && id != null) {
			mydiet.setCode(code);
			mydiet.setRegdate(current);
			mydiet.setAmount(cnt);
			mydiet.setId(id);
			mydietService.insert(mydiet, request); //추가하기
			msg = "성공적으로  추가 되었습니다.";
		}else {
			msg = "추가 중 오류가 발생하였습니다.";
		}
		
		try {
			msg = URLEncoder.encode(msg,"UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CacheException("메세지 인코딩 중 오류 발생");
		}
		return "redirect:detailform.do?code="+code+"&msg="+msg;
	}
	
	
	//상품 정보에서 카트 추가 , 찜버튼 ( 예상 섭취 정보 ) 
	@PostMapping("addcart.do")
	private String addCart(HttpServletRequest request, HttpServletResponse response) {
		
		String amount = request.getParameter("cnt"); //추가 수량 가져오기
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String current = format.format(time);
		
		Cart cart = new Cart();
		String code = request.getParameter("Fcode");
		String msg ="";
		String id = getId(request);
		int cnt = Integer.parseInt(amount);
		
		if(id==null) {
			msg = "로그인을 해주세요.";
		}else if(cnt>0 && code != null && current != null && id != null) {
			cart.setCode(code);
			cart.setRegdate(current);
			cart.setAmount(cnt);
			cart.setId(id);
			cartService.insert(cart, request); //추가하기
			msg ="성공적으로  추가 되었습니다.";
		}else {
			msg= "추가 중 오류가 발생하였습니다.";
		}
		
		
		try {
			msg = URLEncoder.encode(msg,"UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			throw new CacheException("메세지 인코딩 중 오류 발생");
		}
		
		return "redirect:detailform.do?code="+code+"&msg="+msg;
	}
	

	public void addToSession(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}

	public String getId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String) session.getAttribute("id");
	}
	
	public ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "ok");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	public ResponseEntity<Map<String, Object>> handleFail(Object data, HttpStatus status) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "fail");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
}
