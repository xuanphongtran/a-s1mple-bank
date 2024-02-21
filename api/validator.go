package api

import (
	"github.com/go-playground/validator/v10"
	"github.com/xuanphongtran/a-s1mple-bank/util"
)

var validCurrency validator.Func = func(fl validator.FieldLevel) bool {
	if currency, ok := fl.Field().Interface().(string); ok {
		// check currency is supported or not
		return util.IsSupportedCurrency(currency)
	}
	return false
}
