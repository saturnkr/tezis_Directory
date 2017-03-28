update sec_user_setting set value = REPLACE(value,
'position value="0"',
'position value="70"')
where name in ('df$SimpleDoc.edit','tm$Task.edit','df$Contract.edit')

^
delete from sec_user_setting where name in
('tm$Task.edit.resolutionSplit','tm$Task.edit.previewSplit',
'df$SimpleDoc.edit.resolutionSplit','df$SimpleDoc.previewSplit',
'df$Contract.edit.resolutionSplit','df$Contract.edit.previewSplit'
)