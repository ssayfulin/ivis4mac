import grt

def get_figures(diagram):
    figures = {}
    for figure in diagram.figures:
        figures[figure.name] = figure
        print 'set_figure(figures, "%s", %i,%i)'%( figure.name, figure.left, figure.top)
    
    return figures

def set_figure(figures, figureName, left, top):

    if figureName in figures:
        figures[figureName].left = left
        figures[figureName].top = top
    

diagram = grt.root.wb.doc.physicalModels[0].diagrams[0]
diagram.width = 2000
diagram.height = 2000
figures = get_figures(diagram)

set_figure(figures, "person", 1600,620)

set_figure(figures, "person_to_relatives", 1209,607)

set_figure(figures, "country", 746,262)

set_figure(figures, "federal_subject", 144,470)

set_figure(figures, "district", 242,656)

set_figure(figures, "city", 73,574)

set_figure(figures, "address_type", 583,270)

set_figure(figures, "address", 940,509)

set_figure(figures, "competance_type", 1226,28)

set_figure(figures, "competance", 1515,78)

set_figure(figures, "transport_type", 2137,110)

set_figure(figures, "transport", 1956,253)

set_figure(figures, "status_type", 2275,381)

set_figure(figures, "status", 2314,610)

set_figure(figures, "equpement_type", 1916,0)

set_figure(figures, "equpement", 1765,124)

set_figure(figures, "contact_type", 1105,766)

set_figure(figures, "contact", 1327,837)

set_figure(figures, "sign", 1148,180)

set_figure(figures, "sign_detail", 1154,317)

set_figure(figures, "person_to_sign", 1336,235)

set_figure(figures, "organization_type", 214,1033)

set_figure(figures, "organization", 486,1178)

set_figure(figures, "police_statement", 2140,2204)

set_figure(figures, "organization_to_contact", 784,1005)

set_figure(figures, "map_link", 1403,1925)

set_figure(figures, "file", 1972,1927)

set_figure(figures, "incident_state", 1791,1240)

set_figure(figures, "incident", 1549,1403)

set_figure(figures, "incident_to_file", 1708,1839)

set_figure(figures, "police_statement_state", 2503,2197)

set_figure(figures, "police_statement_to_person", 2530,1513)

set_figure(figures, "web_link", 1774,2095)

set_figure(figures, "incident_to_web_link", 1569,1975)