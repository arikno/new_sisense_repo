"select  \n    u.[dashboardId],\n    max(u.timestamp) as last_usage_dashbaord\nfrom \n    Usage u\ngroup by u.[dashboardId]"
