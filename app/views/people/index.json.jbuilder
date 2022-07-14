json.data @people do |p|
	json.legajo p.legajo
	json.last_name p.last_name
	json.name p.name
  json.dni p.dni
  json.cuil p.cuil
  if !p.birth_date.blank?
    json.birth_date p.birth_date.strftime('%d-%m-%y')
  else
    json.birth_date ""
  end

  json.nationality p.nationality
  json.direction p.direction
  json.phone p.phone
  json.company p.company.name
  json.actions " #{link_to '<i class="fa fa-edit"></i>'.html_safe, edit_person_path(p), 
  								class: 'btn btn-warning btn-sm',  :data => {:toggle => 'tooltip'}, title: 'Editar'} 
									<a class='btn btn-danger btn-sm' title='Dar de baja' onclick='modal_disable_person( #{ p.id } )'>
										<i class='fa fa-trash' aria-hidden='true'></i> </a>"
end