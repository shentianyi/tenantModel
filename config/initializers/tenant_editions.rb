
$basic_edition_function = []

$professional_edition_function = $basic_edition_function|[]

$ultimate_edition_function=$professional_edition_function|[]

$tenant_editions={}

$tenant_editions['basic'.downcase] = {:name=>'basic',:limits=>{:user=>1},:trial_period=>15.days,:functions=>$basic_edition_function}

$tenant_editions['professional'.downcase] ={}

$trial_edition = 'basic'

$product_name = 'EPM'






