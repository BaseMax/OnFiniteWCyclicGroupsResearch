counter_has := function(counters, looking_for)
    for counter in counters do
        if counter[2] = looking_for then
            return true;
        fi;
    od;
    return false;
end;

selected_i := [];
for i in [1 .. 2000] do
    factors := FactorsInt(i);
    factors_set := Set(factors);
    if Length(factors_set) = 4 then
        Print(i, " => ", factors, "\n");
        Add(selected_i, i);
    fi;
od;

index := 0;
for i in selected_i do
    index := index+1;
    groups := AllSmallGroups(i);
    for group in groups do
        subs := AllSubgroups(group);

        this_group_is_okay := true;
        counters := [];
        for sub in subs do
            sub_order := Order(sub);
            if counter_has(counters, sub_order) then
                counters[sub_order][1] := counters[sub_order][1] + 1;
            else
                counters[sub_order] := [1, sub_order];
            fi;
            if counters[sub_order][1] > sub_order then
                this_group_is_okay := false;
                break;
            fi;
        od;

        if this_group_is_okay then
            Print(index, "\t", i, "\t", group, "\t", StructureDescription(group), "\n");
        fi;
    od;
od;
