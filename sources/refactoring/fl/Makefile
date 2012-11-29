test:
	make factorial.pretty
	make flat.pretty
	make focus.pretty
	make factorial.apply
	make flat.apply
	make inline

# Parse and pretty print file

%.pretty:
	runghc TestIO.hs samples/$*.fl samples/result.fl
	diff samples/$*.fl samples/result.fl
	rm -f samples/result.fl

# Compute factorial of 5 relative to a file

%.apply:
	runghc TestEvaluator.hs samples/$*.fl samples/apply.fl 120

# Inline a let in focus

inline:
	runghc TestInline.hs samples/focus.fl samples/result.fl
	diff samples/factorial.fl samples/result.fl
	rm -f samples/result.fl
