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

for i in selected_i do
    groups := AllSmallGroups(i);
    # groups := AllSmallGroups(30);
    Print(groups, "\n");
    for group in groups do
        Print(group, "          ");
        Print(StructureDescription(group), "\n");
        subs := AllSubgroups(group);

        counters := [];
        for sub in subs do
            sub_order := Order(sub);
            if counter_has(counters, sub_order) then
                counters[sub_order][1] := counters[sub_order][1] + 1;
            else
                counters[sub_order] := [1, sub_order];
            fi;
            Print("   ", sub_order, "   ->   ", sub, "\n");
        od;

        Print("   Analyze:\n");
        for counter in counters do
            # Print(counter, "\t");
            Print("     ", counter[2], " => ", counter[1], " repeat", "\n");
        od;
        Print("\n");
    od;
od;
