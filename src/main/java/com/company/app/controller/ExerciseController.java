package com.company.app.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.app.model.CheckExercise;
import com.company.app.model.Exercise;
import com.company.app.service.ExerciseService;

@Controller
public class ExerciseController {
    private static final Logger logger = LogManager.getLogger(ExerciseController.class);

    private final ExerciseService exerciseService;

    @Autowired
    public ExerciseController(ExerciseService exerciseService) {
        this.exerciseService = exerciseService;
    }
    
    
    @PostMapping("/exercises/check/")
    public ResponseEntity<Boolean> checkExercise(@RequestBody CheckExercise checkExercise){
    	logger.info("Request {}",checkExercise);
    	return new ResponseEntity<Boolean>(exerciseService.checkAnswer(checkExercise.exerciseId, checkExercise.answer), HttpStatus.OK);
    }
    
    @RequestMapping("/exercises/show/{id}")
    public String getExerciseViewById(Model model, @PathVariable int id) {
        logger.info("Request to /exercises/{}",id);
        Exercise exercise = exerciseService.findById(id);
        model.addAttribute("exercise", exercise);
        logger.info("Response {}",exercise);
        return "exercise";
    }
}
