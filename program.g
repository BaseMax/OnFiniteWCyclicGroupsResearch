# G := SmallGroup( 60, 4 );
#   <pc group of size 60 with 4 generators>
# StructureDescription( G );
#   "C60"

# G := SmallGroup( 60, 5 );
#   Group([ (1,2,3,4,5), (1,2,3) ])
# StructureDescription( G );
#   "A5"

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
    Print(groups, "\n");
    for group in groups do
        Print(group, "\t");
        Print(StructureDescription(group), "\n");
        subs := ConjugacyClassesSubgroups(group);
        for sub in subs do
            Print("\t ==> ", sub, "\n");
        od;
        # TODO, check the group
    od;
od;
