from django.db import models
from django.contrib.auth.models import User

class Type(models.Model):
	name = models.CharField(max_length=200)
	user = models.ForeignKey(User)

	class Meta:
		db_table = "product_type"

	def __unicode__(self):
		return self.name

class Product(models.Model):
	name = models.CharField(max_length=200)
	date = models.DateField()
	end_date = models.DateField()
	value = models.FloatField()
	obs = models.CharField(max_length=200, blank=True)
	type = models.ForeignKey(Type)
	user = models.ForeignKey(User)

	class Meta:
		db_table = "product"