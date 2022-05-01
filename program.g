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

selected_i := [30];

Print("<div class=\"app\">\n");
for i in selected_i do
    groups := AllSmallGroups(i);
    # groups := AllSmallGroups(30);
    Print("\t<div class=\"item\">\n");
        Print("\t\t<h1>SmallGroups of ", i, "</h1>\n<div id=\"smallgroups-", i ,"\">\n");
        Print("\t\t<pre>", groups, "</pre>\n");

        Print("\t\t<ul class=\"smallgroups\">\n");
            for group in groups do
                Print("\t\t\t<li class=\"smallgroup\">", group, " (", StructureDescription(group), ")</li>\n");
                    # Print(group, "          ");
                    # Print(StructureDescription(group), "\n");
                    subs := AllSubgroups(group);

                    Print("\t\t\t\t<button class=\"view-subgroups\">View sub groups</button>\n");
                    Print("\t\t\t\t<button class=\"view-subgroups-repeat\">View repetation of order in sub groups</button>\n");

                    Print("\t\t\t\t<table class=\"subgroups\">\n");
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

                    Print("\t\t\t\t<table class=\"subgroups-repeat\">\n");
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
Print("</div>\n");
