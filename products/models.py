from django.db import models
from django.contrib.auth.models import User

class Type(models.Model):
	name = models.CharField(max_length=200)

class Product(models.Model):
	name = models.CharField(max_length=200)
	obs = models.CharField(max_length=200)
	date = models.DateField()
	end_date = models.DateField()
	value = models.FloatField()
	type = models.ForeignKey(Type)
	user = models.ManyToManyField(User, related_name='users_item')

	class Meta:
		db_table = "product"