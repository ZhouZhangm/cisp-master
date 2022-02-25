package com.zbin.cisp.service;

import org.flowable.task.api.Task;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Zhouhailin on 2021-11-30
 */
public interface FlowableService {

    @Transactional
    public void startProcess();

    @Transactional
    public List<Task> getTasks(String assignee);

}
