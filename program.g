# G := SmallGroup( 60, 4 );
#   <pc group of size 60 with 4 generators>
# StructureDescription( G );
#   "C60"

# G := SmallGroup( 60, 5 );
#   Group([ (1,2,3,4,5), (1,2,3) ])
# StructureDescription( G );
#   "A5"

counter_has := function(counters, looking_for)
    for counter in counters do
        if counter[2] = looking_for then
            return true;
        fi;
    od;
    return false;
end;

selected_i := [];
for i in [1..2000] do
    factors := FactorsInt(i);
    factors_set := Set(factors);
    if Length(factors_set) = 3 then
        Print(i, " => ", factors, "\n");
        Add(selected_i, i);
    fi;
od;

# selected_i := [30];

Print("<style>\ntable thead{font-weight: bold;}\n.subgroups,.subgroups-repeat{display: none;}\n</style>\n\n");
Print("<div class=\"app\">\n");
for i in selected_i do
    groups := AllSmallGroups(i);
    # groups := AllSmallGroups(30);
    Print("\t<div class=\"item\">\n");
        Print("\t\t<h1>SmallGroups of ", i, "</h1>\n\t\t<div id=\"smallgroups-", i ,"\">\n");
        # Print("\t\t<pre>", groups, "</pre>\n");

        Print("\t\t<ul class=\"smallgroups\">\n");
            for group in groups do
                Print("\t\t\t<li class=\"smallgroup\">\n");
                    Print("\t\t\t\t<b>", group, " (", StructureDescription(group), ")</b>\n");
                    # Print(group, "          ");
                    # Print(StructureDescription(group), "\n");
                    subs := AllSubgroups(group);

                    Print("\t\t\t\t<button class=\"btn-subgroups\">View sub groups</button>\n");
                    Print("\t\t\t\t<button class=\"btn-subgroups-repeat\">View repetation of order in sub groups</button>\n");

                    Print("\t\t\t\t<table border=\"1\" class=\"subgroups\">\n");
                        Print("\t\t\t\t\t<thead><tr><td>SubGroup</td><td>Order</td></tr></thead>", "\n");
                        counters := [];
                        for sub in subs do
                            sub_order := Order(sub);
                            if counter_has(counters, sub_order) then
                                counters[sub_order][1] := counters[sub_order][1] + 1;
                            else
                                counters[sub_order] := [1, sub_order];
                            fi;
                            Print("\t\t\t\t\t<tr><td>", sub, "</td><td>", sub_order, "</td></tr>\n");
                        od;
                    Print("\t\t\t\t</table>\n");

                    Print("\t\t\t\t<table border=\"1\" class=\"subgroups-repeat\">\n");
                        Print("\t\t\t\t\t<thead><tr><td>Order</td><td>Repeat</td></tr></thead>", "\n");
                    for counter in counters do
                        # Print(counter, "\t");
                        Print("\t\t\t\t\t<tr><td>", counter[2], "</td><td>", counter[1], "</td></tr>", "\n");
                    od;
                    Print("\t\t\t\t</table>\n");

                Print("\t\t\t</li>\n");
            od;
        Print("\t\t</ul>\n");
    Print("\t</div>\n");
od;
Print("</div>\n\n");

Print("<script type=\"text/javascript\">\n");
Print("const btn_view_subgroups = document.querySelectorAll(\".btn-subgroups\");\n");
Print("btn_view_subgroups.forEach(btn => {\n");
Print("    btn.addEventListener(\"click\", () => {\n");
Print("        document.querySelectorAll(\"table\").forEach(table => table.style.display = \"none\");\n");
Print("        const table = btn.nextElementSibling.nextElementSibling;\n");
Print("        console.log(btn);\n");
Print("        console.log(table);\n");
Print("        table.style.display = \"block\";\n");
Print("    });\n");
Print("});\n");
Print("const btn_view_subgroups_repeat = document.querySelectorAll(\".btn-subgroups-repeat\");\n");
Print("btn_view_subgroups_repeat.forEach(btn => {\n");
Print("    btn.addEventListener(\"click\", () => {\n");
Print("        document.querySelectorAll(\"table\").forEach(table => table.style.display = \"none\");\n");
Print("        const table = btn.nextElementSibling.nextElementSibling;\n");
Print("        table.style.display = \"block\";\n");
Print("    });\n");
Print("});\n");
Print("</script>\n");
