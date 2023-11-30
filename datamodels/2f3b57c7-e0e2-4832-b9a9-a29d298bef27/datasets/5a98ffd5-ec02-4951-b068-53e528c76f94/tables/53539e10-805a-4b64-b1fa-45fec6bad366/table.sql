"select \n    ug.[user_id],\n    ug.[user_group],\n    ug.[group_name],\n    'user_group' as group_source\nfrom\n    [user_group] ug \nunion all\nselect \n    a.[user_id],\n    g.[GroupID] as user_group,\n    g.[GroupName] as group_name,\n    'Admins' as group_source\nfrom\n    [Groups] g\nleft join \n(\nselect \n    du.[user_id]\nfrom\n    [Dim_user_group] du\nwhere \n    du.[role] in ('Sys. Admin' , 'Data Admin')\n) a on 1=1\nwhere \n    g.[GroupName] = 'Admins'\nunion all \nselect  \n    admin_users.[user_id],\n    g.[GroupID],\n    g.[GroupName],\n    'Everyone' as group_source\nfrom\n    Groups g \nleft join \n(\nselect \n    du.[user_id]\nfrom \n    [Dim_Users] du \n) admin_users on 1=1\nwhere \n    g.[GroupName] = 'Everyone'\n\n\n"
