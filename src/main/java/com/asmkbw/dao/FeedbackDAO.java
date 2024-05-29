package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Feedback;

public interface FeedbackDAO extends JpaRepository<Feedback, Integer>{

}
