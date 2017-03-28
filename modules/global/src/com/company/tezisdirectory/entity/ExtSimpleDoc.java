/*
 * Copyright (c) 2017 com.haulmont.thesis.core.entity
 */
package com.company.tezisdirectory.entity;

import javax.persistence.Entity;
import javax.persistence.DiscriminatorValue;
import javax.persistence.InheritanceType;
import javax.persistence.Inheritance;
import com.haulmont.cuba.core.entity.annotation.Extends;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import com.haulmont.thesis.core.entity.SimpleDoc;

/**
 * @author user
 */
@Extends(SimpleDoc.class)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorValue("1110")
@Entity(name = "tezisdirectory$SimpleDoc")
public class ExtSimpleDoc extends SimpleDoc {
    private static final long serialVersionUID = -7111131216841386167L;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "COSTART_ID")
    protected CostArticle costart;

    public void setCostart(CostArticle costart) {
        this.costart = costart;
    }

    public CostArticle getCostart() {
        return costart;
    }


}