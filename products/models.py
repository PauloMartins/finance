from django.db import models
from users.models import User

class Type(models.Model):
	name = models.CharField(max_length=200)

class Item(models.Model):
	name = models.CharField(max_length=200)
	obs = models.CharField(max_length=200)
	date = models.DateField()
	end_date = models.DateField()
	value = models.FloatField()
	type = models.ForeignKey(Type)
	user = models.ManyToManyField(User)

	class Meta:
		db_table = "product"