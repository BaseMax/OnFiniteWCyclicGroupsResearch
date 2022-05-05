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

index := 0;
for i in selected_i do
    index := index+1;
    # Print(index);
    groups := AllSmallGroups(i);
    # groups := AllSmallGroups(30);
    # Print(index, " <=> ", groups, "\n");
    for group in groups do
        # Print(group, "          ");
        # Print(StructureDescription(group), "\n");
        subs := AllSubgroups(group);

        # this_group_is_okay := false;
        this_group_is_okay := true;
        counters := [];
        for sub in subs do
            sub_order := Order(sub);
            if counter_has(counters, sub_order) then
                counters[sub_order][1] := counters[sub_order][1] + 1;
            else
                counters[sub_order] := [1, sub_order];
            fi;
            # Print("   ", sub_order, "   ->   ", sub, "\n");
            if counters[sub_order][1] > sub_order then
                this_group_is_okay := false;
                break;
            fi;
        od;

        # Print("   Analyze:\n");
        # all_subs_are_okay := true;
        # for counter in counters do
        #     # Print(counter, "\t");
        #     Print("     ", counter[2], " => ", counter[1], " repeat", "\n");
        # od;
        # Print("\n");

        # all_subs_are_okay := true;
        # for counter in counters do
        #     if counter[1] > counter[2] then
        #         all_subs_are_okay := false;
        #         break;
        #     fi;
        #     # Print("     ", counter[2], " => ", counter[1], " repeat", "\n");
        # od;

        # if this_group_is_okay or all_subs_are_okay then
        if this_group_is_okay then
            # Print("**************\n");
            # Print("IS OKAY\n");
            Print(index, "\t", i, "\t", group, "\t", StructureDescription(group), "\n");
            # Print(StructureDescription(group), "\n");
            # Print("**************\n");
            # Print(group, "\n");
        fi;
    od;
od;
