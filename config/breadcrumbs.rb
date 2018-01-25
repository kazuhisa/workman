crumb :root do
  link "Home", root_path
end

crumb :group do |group|
  link group.name, group_path(group)
  parent :root
end

crumb :new_group_user do |group|
  link 'ユーザー新規作成', new_group_user_path(group)
  parent :group, group
end

crumb :group_user do |group, user|
  link 'ユーザー詳細', group_user_path(group, user)
  parent :group, group
end

crumb :edit_group_user do |group, user|
  link 'ユーザー編集', edit_group_user_path(group, user)
  parent :group_user, group, user
end
