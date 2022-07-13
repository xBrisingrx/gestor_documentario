json.data @companies do |company|
	json.name company.name
	json.description company.description
  json.actions " #{link_to '<i class="fa fa-pencil"></i>'.html_safe, edit_company_path(company), remote: true,
  								class: 'btn btn-warning btn-sm g-color-white',  :data => {:toggle => 'tooltip'}, title: 'Editar'} 
									<a class='btn btn-danger btn-sm g-color-white' title='Dar de baja' onclick='modal_disable_company( #{ company.id } )'>
										<i class='fa fa-trash-o' aria-hidden='true'></i> </a> "
end