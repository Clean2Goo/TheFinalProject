package com.mySpring.myapp.explore.controller;

import com.mySpring.myapp.carwash.model.CarWash;
import com.mySpring.myapp.carwash.service.CarWashService;
import com.mySpring.myapp.explore.service.KakaoApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ExploreController {

    @Autowired
    private CarWashService carWashService;

    @Autowired
    private KakaoApiService kakaoApiService;

    @GetMapping("/explore.do")
    public String explorePage(Model model) {
        List<CarWash> carWashList = carWashService.getAllCarWashes();
        model.addAttribute("carWashList", carWashList);
        return "explore";
    }

    @GetMapping("/fetch-and-save")
    public String fetchAndSaveCarWashes() {
        double[][] seoulCenters = {
            {127.027619, 37.497942}, // 강남구
            {126.978406, 37.570705}, // 종로구
            {126.929669, 37.617437}, // 은평구
            {127.112743, 37.514126}, // 송파구
            {126.901451, 37.554484}  // 마포구
        };

        try {
            for (double[] center : seoulCenters) {
                kakaoApiService.fetchAndSaveCarWashes("세차장", center[0], center[1], 20000);
            }
            return "redirect:/explore.do";
        } catch (Exception e) {
            System.err.println("Error in /fetch-and-save: " + e.getMessage());
            e.printStackTrace();
            return "error";
        }
    }


}
