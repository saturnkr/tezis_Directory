--$Id: 140527-1200-addRemoteCardState.sql 16261 2014-06-04 15:44:16Z saiyan $

create table TS_REMOTE_CARD_STATE (
    id uniqueidentifier,
    create_ts datetime,
    created_by varchar(50),
    ---
    card_id uniqueidentifier,
    server_id varchar(50),
    state varchar(255),
    constraint fk_remote_card_state_to_card foreign key(card_id) references wf_card(id),
    primary key(id)
);

create unique index idx_ts_remote_card_state_unique on ts_remote_card_state (card_id, server_id);