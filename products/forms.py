# -*- coding: utf-8 -*-
from django import forms
from django.forms import ModelForm
from products.models import Product, Type
from django.contrib.auth.models import User

class FormProduct(forms.ModelForm):
	date = forms.DateField(widget=forms.DateInput(format='%d/%m/%Y'), input_formats=['%d/%m/%y', '%d/%m/%Y'])
	end_date = forms.DateField(widget=forms.DateInput(format='%d/%m/%Y'), input_formats=['%d/%m/%y', '%d/%m/%Y'])

	def __init__(self, *args, **kwargs):
		super(FormProduct, self).__init__(*args, **kwargs)
		
		self.fields.keyOrder = [
			'type',
			'name',
			'value',
			'date',
			'end_date'
		]

	class Meta:
		model = Product
		fields = {'name', 'date', 'end_date', 'value', 'type'}

class FormProductType(forms.ModelForm):

	class Meta:
		model = Type
		fields = {'name'}