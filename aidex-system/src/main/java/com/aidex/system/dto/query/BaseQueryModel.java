package com.aidex.system.dto.query;

import lombok.Data;

@Data
public class BaseQueryModel {
    private int pageNum = 1;
    private int pageSize = 10;
}
