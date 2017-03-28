/*
 * Copyright (c) 2017 com.company.tezisdirectory.entity
 */
package com.company.tezisdirectory.entity;


/**
 * @author user
 */
import com.haulmont.cuba.core.entity.annotation.EnableRestore;
import com.haulmont.cuba.core.entity.annotation.TrackEditScreenHistory;
import javax.persistence.Entity;
import javax.persistence.Table;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.thesis.core.entity.TsUser;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.haulmont.cuba.core.entity.StandardEntity;

@NamePattern("%s|costarticle")
@Table(name = "TEZISDIRECTORY_COST_ARTICLE")
@Entity(name = "tezisdirectory$CostArticle")
@EnableRestore
@TrackEditScreenHistory
public class CostArticle extends StandardEntity {
    private static final long serialVersionUID = 8662352307420846428L;

    @Column(name = "COSTARTICLE", length = 90)
    protected String costarticle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "HOLDER_ID")
    protected TsUser holder;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "COMMERCIAL_ID")
    protected TsUser commercial;

    public void setCommercial(TsUser commercial) {
        this.commercial = commercial;
    }

    public TsUser getCommercial() {
        return commercial;
    }


    public void setCostarticle(String costarticle) {
        this.costarticle = costarticle;
    }

    public String getCostarticle() {
        return costarticle;
    }

    public void setHolder(TsUser holder) {
        this.holder = holder;
    }

    public TsUser getHolder() {
        return holder;
    }


}