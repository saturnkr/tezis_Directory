--$Id: 140429-1830-addNumeratorInitialValue.sql 15960 2014-05-08 08:46:07Z saiyan $

alter table df_numerator add number_initial_value integer ;
update df_numerator set number_initial_value = 1^