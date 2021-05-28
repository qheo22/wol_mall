package com.mall.wolmall.model;

import lombok.Data;

@Data
public class ResultModel<T> {
    public T data;
    public ResultModel(T data) {
        this.data = data;
    }
}
