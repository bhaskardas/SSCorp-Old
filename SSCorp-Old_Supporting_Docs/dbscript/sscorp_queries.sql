
select m.menu_id, m.menu_name, m.menu_url, sm.submenu_id, sm.submenu_name, sm.submenu_url
from sscorp_menu_m m left join sscorp_submenu_m sm on m.menu_id = sm.menu_id
where m.company_id = 1
order by m.menu_position, sm.submenu_position