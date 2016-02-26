package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by yongyeonkim on 2016. 2. 26..
 */
@Getter
@Setter
public class SearchCriteria extends Criteria {

    private String searchType;
    private String keyword;

    public String toString() {
        return super.toString() + " SearchCriteria " + "[searchType=" + searchType + ", keyword=" + keyword + "]";
    }
}
