package com.zbin.cisp.service.impl;

import com.zbin.cisp.service.FlowableService;


import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FlowableServiceImpl implements FlowableService {

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Transactional
    @Override
    public void startProcess() {
        runtimeService.startProcessInstanceByKey("oneTaskProcess");
    }

    @Transactional
    @Override
    public List<Task> getTasks(String assignee) {
        return taskService.createTaskQuery().taskAssignee(assignee).list();
    }
}
