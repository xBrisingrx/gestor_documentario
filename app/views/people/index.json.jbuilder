json.data @people do |p|
  json.legajo p.legajo
  json.last_name p.last_name
  json.name p.name
  json.dni p.dni

  if p.pdf_dni.attached?
    json.pdf_dni "#{ link_to '<i class="fa fa-file-pdf fa-2x"></i>'.html_safe, p.pdf_dni, target: '_blank' }"
  else
    json.pdf_dni 'no'
    # json.pdf_dni "#{ link_to '<i class="fa fa-file-pdf fa-2x"></i>'.html_safe, attach_pdf_to_person_path( id: p.id, pdf: 'pdf_dni', pdf_name: "DNI" ), remote: true, class: 'text-center text-danger' }"
  end

  if p.dni_has_expiration
    json.dni_has_expiration "<td> Si: #{p.expiration_date_dni.strftime('%d-%m-%y')} </td>"
  else
   json.dni_has_expiration "<td> No </td>"
  end

  json.cuil p.cuil

  if p.pdf_cuil.attached?
    json.pdf_cuil "#{ link_to '<i class="fa fa-file-pdf fa-2x"></i>'.html_safe, p.pdf_cuil, target: '_blank' }"
  else
    json.pdf_cuil 'no'
    # json.pdf_cuil "#{ link_to '<i class="fa fa-file-pdf fa-2x"></i>'.html_safe, attach_pdf_to_person_path( id: p.id, pdf: 'pdf_cuil', pdf_name: "CUIL" ), remote: true, class: 'text-center text-danger' }"
  end

  if !p.birth_date.blank?
    json.birth_date p.birth_date.strftime('%d-%m-%y')
  else
    json.birth_date ""
  end

  if p.pdf_start_activity.attached?
    json.pdf_start_activity "#{ link_to '<i class="fa fa-file-pdf fa-2x"></i>'.html_safe, p.pdf_start_activity, target: '_blank' }"
  else
    json.pdf_start_activity 'no'
    # json.pdf_start_activity "#{ link_to '<i class="fa fa-file-pdf fa-2x"></i>'.html_safe, attach_pdf_to_person_path( id: p.id, pdf: 'pdf_start_activity', pdf_name: "inicio actividad" ), remote: true, class: 'text-center text-danger' }"
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