package com.mall.wol.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mall.wol.model.MallitemDTO;
import com.mall.wol.model.basketDto;

import com.mall.wol.service.MallitemService;



@Controller
public class MainController {
   @Autowired
   MallitemService mservice;

  
ArrayList<basketDto> list = new ArrayList<basketDto>();
    
   
   @RequestMapping("/main.do")
      public String mainpage(HttpSession Session) {
      Session.invalidate();
      System.out.println("추가한 아이템 갯수는?"+list.size());
         return "layouts-tiles";
      }
      
      @RequestMapping("/idinfo.do")
         public String idinfo(){
         return "idinfo";
         }
      

   @RequestMapping(value = "loginpage.do")
   public String login() {
      return "loginpage";
   }
      
   
      @RequestMapping(value = "itemupdateform.do")
      public String itemupdateform() {
         return "itemupdate";
      }
      
      
      
      @RequestMapping(value = "select.do")
      public String best(Model m,String kinds) {
         System.out.println(kinds);
         m.addAttribute("items",mservice.select_item(kinds));
         return "layouts-tiles";
      }
      
      
   //아이템 상세보기
  	@RequestMapping(value = "item_detail.do")
	public String item_detail(String item_code,MallitemDTO dto,Model m) {
		int item_codes = Integer.parseInt(item_code);
		dto = mservice.select_item(item_codes);
		System.out.println("매퍼에서 가져온 옷의 가격은"+dto.getItem_price_sell());
		m.addAttribute("size",dto.getItem_size().split(","));
		m.addAttribute("color",dto.getItem_color().split(","));
		m.addAttribute("dto",dto);
		int item_count = 1;
		m.addAttribute("item_count",item_count);
		return "item_detail";
	}

      
      
      
      @RequestMapping(value = "order_page.do")
      public String order_page(Model m) {
    	m.addAttribute("list", list);
         return "order";
      }
      
      
		// 구매목록 담아오는부분
		@RequestMapping(value = "order.do")
		public String cart(String[] cartArray,String item_name,HttpServletRequest request) {
			System.out.println("찍어만보자 뭐가담겨잇는지" + cartArray.length);
			for (int j = 0; j <= cartArray.length; j += 5) {
				basketDto dto = new basketDto();
				System.out.println("큰포문 도는횟수");
				for (int i = j; j < cartArray.length; i++) {
					if ((i + 1) % 5 == 1) {
						dto.setItem_size(cartArray[i]);
						System.out.println("사이즈몇번돔?");
						System.out.println("집어넣은 사이즈" + dto.getItem_size());
					} else if ((i + 1) % 5 == 2 && i != 0) {
						dto.setItem_color(cartArray[i]);
						System.out.println("컬러몇번돔?");
						System.out.println("집어넣은 컬러" + dto.getItem_color());
					} else if ((i + 1) % 5 == 3 && i != 0) {
						dto.setItem_count(cartArray[i]);
						System.out.println("카운트 몇번돔?");
					} else if ((i + 1) % 5 == 4 && i != 0) {
						dto.setItem_price(cartArray[i]);
						System.out.println("가격 몇번돔?");
					} else if ((i + 1) % 5 == 0 && i != 0) {
						dto.setItem_name(cartArray[i]);
						System.out.println("이름 몇번돔??");
						System.out.println(
						dto.getItem_color() + dto.getItem_size() + dto.getItem_count() + dto.getItem_price());
						list.add(dto);
						break;
					}
				}

			}
			System.out.println("사이즈 몇개냐" + list.size());
			return "redirect:order_page.do";

		}
}
      