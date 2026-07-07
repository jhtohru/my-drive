.PHONY: gen
gen:
	@buf generate proto/ --template proto/buf.gen.yaml

.PHONY: dep-update
dep-update:
	@buf dep update proto/
