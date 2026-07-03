.PHONY: gen
gen:
	@buf generate protos/ --template protos/buf.gen.yaml

.PHONY: dep-update
dep-update:
	@buf dep update protos/
